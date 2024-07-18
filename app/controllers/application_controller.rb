# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session.key?(:user_id)
  end

  def log_in(user)
    session[:user_id] = user.id
    @current_user     = user
    user.update(present: true)

    Turbo::StreamsChannel.broadcast_append_to(
      "users",
      partial: "users/user",
      locals: { user: }
    )

    redirect_to root_path
  end

  def log_out(user)
    user.update(present: false)
    session.delete(:user_id)
    @current_user = nil
    Turbo::StreamsChannel.broadcast_remove_to(
      "users",
      partial: "users/user",
      locals: { user: }
    )
  end

  def require_login
    redirect_to(login_path) if current_user.nil?
  end
end
