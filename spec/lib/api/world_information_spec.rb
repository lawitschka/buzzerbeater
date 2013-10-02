require 'spec_helper'

describe Buzzerbeater::API::WorldInformation do

  describe 'Countries method' do
    let(:api) { api = Buzzerbeater::API.new }

    it 'should exist' do
      api.should respond_to :countries
    end

    it 'should return an array of country objects', :vcr do
      api.login('wellness', 'auth_token')

      response = api.countries
      response.should be_instance_of(Array)
      response.first.should be_instance_of(Country)
    end

    it 'should raise a not authorized exception if we are not logged in', :vcr do
      expect{ api.countries }.to raise_exception(Buzzerbeater::Exception::NotAuthorized)
    end
  end

end