require 'rails_helper'

RSpec.describe Resource, type: :model do
  before(:all) do
    @resource = create(:resource)
  end

  it { should belong_to(:grant) }

  it "is valid with valid attributes" do
    expect(@resource).to be_valid
  end

  it 'is not valid without a file_name' do
    resource = build(:resource, file_name: nil)
    expect(resource).to_not be_valid
  end

  it 'is not valid without a url' do
    resource = build(:resource, url: nil)
    expect(resource).to_not be_valid
  end

end
