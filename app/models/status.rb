require 'net/http'
require 'rest_client'
require 'ipmonitor'

class Status < ApplicationRecord
  belongs_to :resource, counter_cache: true, touch: true

  def self.run_check(resource)
    IPMonitor::Tools.verbose_sleep(rand(1..5))
    # IPMonitor.logger.info "self.resource #{self.inspect}"
    client = IPMonitor::Client.new(resource)
    response = client.create_response
  end

  def self.status_groups
    select(:status).group(:status)
  end

  def self.latest
    where(latest: true)
  end

  def self.active
    joins(:resource).where(resources: { active: true })
  end

  def grant
    resource.grant
  end

  ##
  # Update cache if current status is different from previous status
  # @param [Status]
  def update_cache(previous)
    grant.overall_status force_update: true if new_status_different?(previous)
  end

  private

  ##
  # Checks to see if the current status is different the previous
  # status.
  # @param [Status]
  def new_status_different?(previous)
    return true unless previous.present?
    status != previous.status
  end
end
