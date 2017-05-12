module Listing::Searchable
  extend ActiveSupport::Concern

  def search_data
    {
      name: name,
      introduction: introduction
    }
  end

  class_methods do
    def index_data
      {}
    end
  end

end