require 'rails_helper'

RSpec.describe Institution, type: :model do
  before(:all) do
    @institution1 = create(:institution)
  end

  it "is valid with valid attributes" do
    expect(@institution1).to be_valid
  end

  # it 'has a unique name' do
  #   institution = build(:institution, name: @institution1.name)
  #   expect(institution).to_not be_valid
  # end

  it "is not valid without a name" do
    institution = build(:institution, name: nil)
    expect(institution).to_not be_valid
  end

  it 'should have many grants' do
    institution = Institution.reflect_on_association(:grants)
    expect(institution.macro).to eq(:has_many)
  end

end
