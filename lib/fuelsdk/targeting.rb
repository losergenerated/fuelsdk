module FuelSDK::Targeting
  attr_accessor :auth_token
  attr_accessor :endpoint

  include FuelSDK::HTTPRequest

  def refresh
    raise NotImplementedError
  end

  def endpoint
    @endpoint ||= determine_stack
  end

  def determine_stack
    refresh unless self.auth_token
    options = {'params' => {'access_token' => self.auth_token}}
    stack_uri = "https://www.exacttargetapis.com/platform/v1/endpoints/soap"
    response = get(stack_uri, options)
    raise FuelSDK::StackRecognitionError.new('Unable to determine stack', :response => response, :request_options => options, :uri => stack_uri) unless response.success?
    response['url']
  end
end
