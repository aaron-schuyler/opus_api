class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])
    if user.try(:authenticate, params[:password])
      token = JsonWebToken.encode({user_id: user.id})
      cookies.signed[:jwt] = {value: token, httponly: true}
      render json: {success: true, jwt: cookies.signed[:jwt]}
    else
      render json: {error: "Invalid username or password"}
    end
  end
  def check_session
    begin
      user = current_user
    rescue
      render json: {loggedIn: false}
    end
    render json: {loggedIn: true} if !!user
  end
  def destroy
    cookies.delete :jwt
  end
end
