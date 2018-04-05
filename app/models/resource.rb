class Resource < ApplicationRecord
  extend FriendlyId
  friendly_id :file_name, use: :slugged

  belongs_to :grant
  has_many :ping

  validates :file_name, presence: true
  validates :url, presence: true

end
