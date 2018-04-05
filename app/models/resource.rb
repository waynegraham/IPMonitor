class Resource < ApplicationRecord
  extend FriendlyId
  friendly_id :file_name, use: :slugged

  belongs_to :grant

  validates :file_name, presence: true
  validates :url, presence: true

end
