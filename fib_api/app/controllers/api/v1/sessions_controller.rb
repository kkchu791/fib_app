class Api::V1::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = User.find_by_email(sessions_params[:email])
    if user && user.authenticate(sessions_params[:password])
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user,
      }
    else
      render json: {
        status: 401,
        error: ["Email or password are not valid."]
      }
    end
  end

  def logged_in
    if current_user
      render json: {
        logged_in: true,
        user: current_user
      }
    else
      render json: {
        logged_in: false,
      }
    end
  end

  def logout
    reset_session
    render json: {
      status: 200,
      logged_out: true,
    }
  end


  private

  def sessions_params
    params.require(:session).permit(:email, :password)
  end
end
