module Login
  def log_in(user)
    @controller = AuthenticationController.new
    post :login, params: { user: { username: user.username, password: user.password }}
    return "Authorization" => "Bearer #{JSON.parse(response.body)['token']}"
  end
end

