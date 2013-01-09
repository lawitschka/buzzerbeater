require 'httparty'

# Buzzerbeater API wrapper class
#
# @author  Moritz Lawitschka <moritz@urbanvention.com>
class Buzzerbeater::API
  include HTTParty

  # HTTParty configuration
  base_uri 'bbapi.buzzerbeater.com'
  format :xml

  # @!attribute session_id
  #   @return [String] the session ID used by this API object
  attr_accessor :session_id

  # @!attribute auth_token
  #   @return [String] the authentication token for this session
  attr_accessor :auth_token



  # Create a new API object.
  #
  # When creating a new API object as entry point for accessing the API a session ID and authentication
  # token can be provided if already retrieved during a former login.
  #
  # @example
  #   api = Buzzerbeater::API.new
  #   api = Buzzerbeater::API.new('session_id', 'auth_token')
  #
  # @see Buzzerbeater::API#login
  #
  # @param [String] session_id the session ID retrieved from the API after performing a login (optional)
  # @param [String] auth_token the authentication token returned by the login method (optional)
  #
  # @return [Buzzerbeater::API] the API object.
  def initialize(session_id, auth_token)
    @session_id, @auth_token = session_id, auth_token
  end

end