module SpecialDelivery
  class BaseEvent
    attr_reader :params

    def initialize(params)
      @params = params || {}
    end

    def issue_callback
      delivery.callback(callback_method)
    end

    private

    def callback_method
      raise NotImplementedError, 'Event subclasses must implement #callback_method'
    end

    def delivery
      new_params = HashClod.new
      params.map { |k, v| new_params[k] = v }
      message_id = new_params['Message-Id']
      @delivery ||= Delivery.find_by_message_id!(message_id)
    end
  end
end
