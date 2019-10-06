module Secured

  def authenticate_user!
    # Bearer xxxxx
    token_regex = /Bearer (\w+)/
    # Read auth HEADER
    headers = request.headers
    # Check if is valid 
    if headers['Authorization'].present? && headers['Authorization'].match(token_regex)
      token = headers['Authorization'].match(token_regex)[1]
      #User have token
      if ( Current.user = User.find_by_auth_token(token) )
        return 
      end
    end
    
    render json: {error: 'Unauthorized'}, status: :unauthorized
  end
  
end