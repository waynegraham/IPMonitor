module GrantsHelper
  def latest_status(grant)
    link_to latest_status_badge(grant.latest_status), grant.latest_status unless grant.latest_status.nil?
  end

  def recent_status(grant)
    recent_status_badge(grant.recent_status) unless grant.recent_status.nil?
  end
end
