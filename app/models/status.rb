class Status < ApplicationRecord
  belongs_to :resources, counter_cache: true, touch: true

  def self.run_check(resource)

  end

  def self.status_groups
    select(:status).group(:status)
  end

  def self.latest
    where(latest: true)
  end

  def self.active
    joins(:resource).where(resource: {active: true})
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
