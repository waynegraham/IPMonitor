module IPMonitor
  require 'ipmonitor/client'
  require 'ipmonitor/exceptions'
  require 'ipmonitor/response'
  require 'ipmonitor/tools'

  def self.logger
    ::Rails.logger
  end
end
