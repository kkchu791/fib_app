class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user,
      }
    else
      render json: {
        status: 500,
        error: user.errors.full_messages
      }
    end
  end

  private

  def user_params
     params.permit(:first_name, :last_name, :email, :password)
   end
end
