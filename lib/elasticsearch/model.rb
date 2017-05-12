
module Elasticsearch::Model
  extend ActiveSupport::Concern

  included do
    extend ClassMethods

    after_commit on: [:create, :update] do
      __elasticsearch__.reindex_record self
    end

    after_commit on: :destroy do
      __elasticsearch__.delete_record_index self
    end
  end

  module ClassMethods
    def __elasticsearch__
      @@__elasticsearch__ ||= Elasticsearch::ModelProxy.new self
    end
  end

  def __elasticsearch__
    self.class.__elasticsearch__
  end
end