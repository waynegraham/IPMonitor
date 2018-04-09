module IPMonitor
  class Client
    attr_accessor :start_time, :end_time

    ##
    # Create a IPMonitor::Client based off of a Layer
    # @param [IPMonitor::Resource]
    def initialize(resource, options = {})
      @resource = resource
      @options = options
    end

    ##
    # url used for Resource request
    # @return [String]
    def url
      @resource.url
    end

    ##
    # Starts a response, it's timer, and then creates a IPMonitor::Repsponse
    # @return [IPMonitor::Response]
    def create_response
      @start_time = Time.now
      begin
        response = grab_resource unless @resource.nil
      rescue IPMonitor::Exceptions::ResourceFailed => error
        response = error
      end
      @end_time = Time.now
      IPMonitor::Response.new(response)
    end

    ##
    # Initiates Resource request from a remote server. Will catch
    # Faraday::Error::ConnectionFailed and Faraday::Error::TimeoutError
    # @return [Faraday::Request] returns a Faraday::Request object
    def grab_resource
      conn = Faraday.new(url: url)
      conn.get do |request|
        request.params = request_params
        request.options.timeout = timeout
        request.options.open_timeout = timeout
      end
    rescue Faraday::Error::ConnectionFailed
      raise IPMonitor::Exceptions::ResourceFailed, message: 'Connection failed', url: conn.url_prefix.to_s
    rescue Faraday::Error::TimeoutError
      raise IPMonitor::Exceptions::ResourceFailed, message: 'Connection timeout', url: conn.url_prefix.to_s
    end

    ##
    # Elapsed tile request time in seconds
    # @return [Float]
    def elapsed_time
      @end_time - @start_time if @start_time && @end_time
    end

    private

    ##
    # Returns timeout for the external request
    # @return [Fixnum] request timeout in seconds
    def timeout
      @options[:timeout] || 10
    end
  end
end
