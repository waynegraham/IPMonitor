class Institution < ApplicationRecord
  validates :name, presence: true
  has_many :grants
end
