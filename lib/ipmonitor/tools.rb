module IPMonitor::Tools
  def self.verbose_sleep(time)
    IPMonitor.logger.info "Waiting for #{time} seconds"
    sleep(time)
  end
end
