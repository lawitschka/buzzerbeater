require 'spec_helper'

describe Authentication do

  describe 'Login method' do
    let(:api) { api = Buzzerbeater::API.new }

    it 'should exist' do
      api.should respond_to :login
    end

    it 'should return a true for a successful login', :vcr do
      api.login('wellness', 'auth_token').should be_true
    end

    it 'should return false for an unsuccessful login', :vcr do
      api.login('wellness', 'wrong').should be_false
    end

    it 'should set the session ID and authentication token after login', :vcr do
      api.session_id.should be_nil
      api.auth_token.should be_nil

      api.login('wellness', 'auth_token')

      api.session_id.should_not be_nil
      api.auth_token.should_not be_nil
      api.session_id.should be_eql(buzzerbeater_session_id)
      api.auth_token.should be_eql(buzzerbeater_auth_token)
    end

  end

  describe 'Logout method' do
    let(:api) { api = Buzzerbeater::API.new }

    it 'should exist' do
      api.should respond_to :logout
    end

    it 'should return true for successful logout', :vcr do
      api.login('wellness', 'auth_token')
      api.logout.should be_true
    end

  end

end