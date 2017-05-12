class GeneralResponse
  attr_reader :status, :messages, :data

  def initialize status, messages: [], errors: [], data: {}
    @status = status
    @messages = messages
    @errors = errors
    @data = data
  end

  def success?
    @status == :success
  end
end