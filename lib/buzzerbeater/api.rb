require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/hash/reverse_merge'
require 'httparty'

require 'buzzerbeater/api/authentication'

# Buzzerbeater API wrapper class
#
# @author  Moritz Lawitschka <me@moritzlawitschka.de>
class Buzzerbeater::API
  include HTTParty
  include Authentication

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
  def initialize(session_id = nil, auth_token = nil)
    @session_id, @auth_token = session_id, auth_token
  end



  private

    # Parses the given XML document and returns an instance of XML::Document
    # for further processing.
    #
    # @api private
    #
    # @param [String] text the text to be URI encoded
    #
    # @return [String] the text as URI encoded copy
    def uri_encode(text)
      URI.escape(text, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
    end

    # Retrieves the specfied cookie's value.
    #
    # @api private
    #
    # @param [HTTParty::Response] response the request's response including headers
    # @param [String] cookie_name the cookie's name to be retrieved
    #
    # @return [String] the cookie value
    def retrieve_cookie(response, cookie_name)
      value = response.headers['set-cookie'].scan(/#{cookie_name}=[a-zA-Z0-9]+/).first
      value = value[cookie_name.length+1..-1] if value
    end

end