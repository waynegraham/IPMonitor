class Institution < ApplicationRecord
  validates :name, presence: true
  has_many :grants

  def resource_count
    grants = Grant.where(institution_id: id).ids
    Resource.where(grant_id: grants).count
  end
end
