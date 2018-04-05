require 'rails_helper'

RSpec.describe Ping, type: :model do
  before(:each) do
    @ping = create(:ping)
  end

  describe 'creates a ping' do
    it 'has a status' do
      expect(@ping.status).to eq(true)
    end

    it 'has the latest' do
      expect(@ping.latest).to eq(true)
    end

    it 'has a url' do
      expect(@ping.resource.url).not_to be_nil
    end

    it 'should have one Ping' do
      expect(Ping.all.count).to eq(1)
    end
  end

  describe 'checking resource ping' do
    before(:each) do
      Ping.check_status(create(:grant))
    end

    it 'creates a new ping' do
      expect(Ping.all.count).to eq(2)
    end

    it 'should not have the first record being the latest' do
      expect(Ping.first.latest).to be true
    end
  end
end
