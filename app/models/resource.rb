class Resource < ApplicationRecord
  extend FriendlyId
  friendly_id :file_name, use: :slugged

  belongs_to :grant
  has_many :statuses
  has_one :latest_status,
          ->(_object) { where('latest = ?', true) }, class_name: 'Status'

  validates :file_name, presence: true
  validates :url, presence: true

  ##
  # Finds the current status of a given resource
  #
  def current_status
    Status.find_by(resource_id: id, latest: true)
  end

  def recent_status
    last_seven = Status.where(resource_id: id).last(7)
    ok_count = last_seven.count { |stat| stat.status == 'OK' }
    { ok: ok_count.to_f, count: last_seven.count.to_f }
  end

  ##
  # Returns a Resource's status score
  #
  def recent_status_score
    recent_status[:ok] / recent_status[:count]
  end

  def self.current_recent_status(params)
    where(grant_id: params[:id], active: true)
      .with_current_status(params[:status])
      .includes(:latest_status)
      .order(updated_at: :desc)
  end

  ##
  # Query Resource with a particular status, if param is nil,
  # then return Resource
  #
  def self.with_current_status(status)
    if status.nil?
      all
    else
      joins(:statuses).where(status: { latest: true, status: status })
    end
  end
end
