module IPMonitor
  class Client
    attr_accessor :start_time, :end_time

    ##
    # Create a IPMonitor::Client based off a Resource
    def initialize(resource, options={})
      @resource = resource
      @options = options
    end
  end
end
