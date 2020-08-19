class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])
    if user.try(:authenticate, params[:password])
      token = JsonWebToken.encode({user_id: user.id})
      cookies.signed[:jwt] = {value: token, httponly: true}
      render json: {success: true}
    else
      render json: {error: "Invalid username or password"}
    end
  end
  def check_session
    user = current_user
    if !!user
      render json: {loggedIn: true}
    else
      render json: {loggedIn: true}
    end
  end
  def destroy
    cookies.delete :jwt
  end
end
