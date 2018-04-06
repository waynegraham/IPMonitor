class Grant < ApplicationRecord
  validates :grant_number, presence: true
  validates :grant_title, presence: true
  validates :primary_contact, presence: true
  validates :email, presence: true

  belongs_to :institution
  has_many :resources
  validates :institution_id, presence: true

  delegate :name, to: :institution, prefix: true

  def overall_status(options = {})
    if options[:force_update]
      Rails.cache.write("grant/#{id}/overall_status", calculate_overall_status)
    end
    Rails.cache.fetch("grant/#{id}/overall_status", expires_in: 24.hours) do
      calculate_overall_status
    end
  end

  def last_ping_status
    pings.recent_status
  end

  def resource_count(options = {})
    if options[:force_update]
      Rails.cache.write("grant/#{id}/resource_count", calculate_overall_status)
    end
    Rails.cache.fetch("grant/#{id}/overall_status", expires_in: 24.hours) do
      calculate_overall_status
    end
  end

  def active_resources
    resources.where(active: true)
  end

  private

  def calculate_overall_status
    Status.where(resource_id: active_resources)
      .where(latest: true)
      .select(:status)
      .group(:status)
      .count
  end

  def calculate_resource_count
    active_resources.count
  end


end
