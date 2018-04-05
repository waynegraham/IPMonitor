class Grant < ApplicationRecord
  validates :grant_number, presence: true
  validates :primary_contact, presence: true
  validates :email, presence: true

  belongs_to :institution
end
