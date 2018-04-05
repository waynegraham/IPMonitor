namespace :files do
  desc 'Check status of active resources that have no status'
  task check_empties: :environment do
    resources = Resources.where(active: true).where('id NOT IN (SELECT DISTINCT(resource_id) FROM statuses)')

    resources.shuffle.each do |resource|
      next if resource.grant.pings.last.nil?
      next unless resource.grant.pings.last.status

      # Skip if access is restricted
      next if resource[:access] == 'Restricted'
      Status.run_check(resource)
    end
  end

  desc 'Check active resources'
  task check_all: :environment do
    resources = Resource.where(active: true)
    resources.shuffle.each do |resource|
      # Skip if not pingable
      next unless resource.grant.pings.last.status

      # Skip if access is restricted
      next if resource[:access] == 'Restricted'

      # Run status check
      Status.run_check(resource)
    end
  end
end

namespace :ping do
  desc 'Ping all files'
  task files: :environment do
    institutions = Institution.all

    institutions.shuffle.each do |host|
      # Ping.check_status(host)
    end
  end
end
