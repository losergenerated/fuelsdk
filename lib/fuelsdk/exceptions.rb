module FuelSDK
  class FuelError < StandardError
    attr_accessor :response, :request_options

    def initialize(message, opts={})
      super(message)
      self.response = opts[:response]
      self.request_options = opts[:request_options]
      self.uri = opts[:uri]
    end
  end

  class DescribeError < StandardError
    attr_reader :response
    def initialize response=nil, message=nil
      response.instance_variable_set(:@message, message) # back door update
      @response = response
      super message
    end
  end

  class StackRecognitionError < FuelError; end

  class InvalidParameterError < FuelError; end

  class UrlCompletionError < FuelError; end

  class UnableToProcessError < FuelError; end

  class UnauthorizedAccessError < FuelError; end

  class MissingParameterError < FuelError; end

  class TokenError < FuelError; end

  class SignatureError < FuelError; end

end