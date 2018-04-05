class Ping < ApplicationRecord
  belongs_to :resource, counter_cache: true, touch: true

  def self.check_status(resource)
    Rails.logger.debug "Pinging #{resource.url} ..."
    begin
      p = Net::Ping::HTTP.new(resource.url).ping?
    rescue URI::InvalidURIError => error
      Rails.logger.error "#{error} url is \"#{resource.url}\" for resource_id #{resource.id}"
      p = false
    end
    Rails.logger.info "Ping result: #{p}"
    current = Ping.create(resource_id: resource.id, status: p, latest: true)

    old_pings = Ping.where(resource_id: resource.id).where('id != ?', current.id)

    if old_pings.length > 0
      old_pings.each do |old|
        old.latest = false
        old.save
      end
    end
  end

  def self.recent_status
    last.status if last
  end
end
