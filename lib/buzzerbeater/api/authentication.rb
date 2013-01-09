module Authentication

  # Cookie name for Buzzerbeater's session key
  SESSION_ID_COOKIE = "ASP.NET_SessionId"

  # Cookie name for Buzzerbeater's auth token
  AUTH_TOKEN_COOKIE = ".ASPXAUTH"



  # Performs a login for given user.
  #
  # @param [String] username the user's username
  # @param [String] access_key the user's access key
  #
  # @return [Boolean] Returns true if the login was successful, false otherwise
  def login(username, access_key)
    return false unless username.present? && access_key.present?

    params = { :login => uri_encode(username), :code => access_key }
    response = self.class.get('/login.aspx', :query => params)
    xml = response.parsed_response

    if response.success? && !xml['bbapi'].has_key?('error')
      self.session_id = retrieve_cookie(response, SESSION_ID_COOKIE)
      self.auth_token = retrieve_cookie(response, AUTH_TOKEN_COOKIE)
      return true
    else
      return false
    end
  end

  # Logs the user out from the current session.
  #
  # @return [Boolean] Returns true if the logout was successful, false otherwise
  def logout
    return true unless session_id.present? && auth_token.present?

    response = self.class.get('/logout.aspx', :headers => auth_header)
    xml = response.parsed_response

    response.success? && !xml['bbapi'].has_key?('error')
  end



  private

    def auth_header(header = {})
      header.reverse_merge({
        'cookie' => "#{SESSION_ID_COOKIE}=#{self.session_id};#{AUTH_TOKEN_COOKIE}=#{self.auth_token}"
      })
    end

end