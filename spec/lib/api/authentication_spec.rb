require 'spec_helper'
# require "/spec/lib/api/web_mocks.rb"

describe Authentication, :api_request => true do
  include_context 'web mocks'

  describe 'Login method' do
    let(:api) { api = Buzzerbeater::API.new }

    it 'should exist' do
      api.should respond_to :login
    end

    it 'should return a true for a successful login' do
      api.login(@buzzerbeater_username, @buzzerbeater_right_auth_code).should be_true
    end

    it 'should return false for an unsuccessful login' do
      api.login(@buzzerbeater_username, @buzzerbeater_wrong_auth_code).should be_false
    end

    it 'should set the session ID and authentication token after login' do
      api.session_id.should be_nil
      api.auth_token.should be_nil

      api.login(@buzzerbeater_username, @buzzerbeater_right_auth_code)
      api.session_id.should_not be_nil
      api.auth_token.should_not be_nil
      api.session_id.should be_eql(@buzzerbeater_session_id)
      api.auth_token.should be_eql(@buzzerbeater_auth_token)
    end

  end

  describe 'Logout method' do
    let(:api) { api = Buzzerbeater::API.new(@buzzerbeater_session_id, @buzzerbeater_auth_token) }

    it 'should exist' do
      api.should respond_to :logout
    end

    it 'should return true for successful logout' do
      api.logout.should be_true
    end

  end

end