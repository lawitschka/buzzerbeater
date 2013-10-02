module Buzzerbeater::API::WorldInformation

  # Retrieves the list of countries in Buzzerbeater
  #
  # @return [Array] Returns an array of countries
  def countries
    response = self.class.get('/countries.aspx', :headers => auth_header)
  end

end