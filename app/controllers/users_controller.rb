class UsersController < ApplicationController
  def create
    user = User.new(username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.valid?
      user.save
    else
      render json: {success: false, messages: user.errors.full_messages}
    end
  end
end
