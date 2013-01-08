require 'httparty'

# Buzzerbeater API wrapper class
#
# @author  Moritz Lawitschka <moritz@urbanvention.com>
class Buzzerbeater::API
  include HTTParty

  # HTTParty configuration
  base_uri 'bbapi.buzzerbeater.com'
  format :xml


  # Create a new API object.
  #
  # @example
  #   api = Buzzerbeater::API.new('username', 'access_key')
  #
  # @param [String] username the username
  # @param [String] access_key the user's access key
  #
  # @return [Buzzerbeater::API] the API object.
  def initialize(username, access_key)
    @username, @access_key = username, access_key
  end

end