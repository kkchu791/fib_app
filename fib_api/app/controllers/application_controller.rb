class ApplicationController < ActionController::API
  include ActionController::RequestForgeryProtection
  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  private

  def current_user
    # if session[:user_id]
    #   @current_user ||= User.find(session[:user_id])
    # end

    @current_user = User.find(1)
  end
end
