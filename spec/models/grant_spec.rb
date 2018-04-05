require 'rails_helper'

RSpec.describe Grant, type: :model do
  before(:all) do
    @grant = create(:grant)
  end

  it { should belong_to(:institution) }

  it 'is valid with valid attributes' do
    expect(@grant).to be_valid
  end

  it 'is not valid without a grant_number' do
    grant = build(:grant, grant_number: nil)
    expect(grant).to_not be_valid
  end

  it 'is not valid without a grant_title' do
    grant = build(:grant, grant_title: nil)
    expect(grant).to_not be_valid
  end

  it 'is not valid without a primary_contact' do
    grant = build(:grant, primary_contact: nil)
    expect(grant).to_not be_valid
  end

  it 'is not valid without a email' do
    grant = build(:grant, email: nil)
    expect(grant).to_not be_valid
  end

  it 'is not valid without an institution' do
    grant = build(:grant, institution: nil)
    expect(grant).to_not be_valid
  end


end
