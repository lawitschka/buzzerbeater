require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/hash/reverse_merge'
require 'httparty'

# Buzzerbeater API wrapper class
#
# @author  Moritz Lawitschka <me@moritzlawitschka.de>
module Buzzerbeater::API

  # Pseudo constructor delegating the construction of a new API instance to the
  # API's base class
  #
  # # @see Buzzerbeater::API::Base#initialize
  def self.new(session_id = nil, auth_token = nil)
    Base.new(session_id, auth_token)
  end

end

require 'buzzerbeater/api/base'

