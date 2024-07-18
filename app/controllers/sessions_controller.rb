class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by(create_params)

    if user
      log_in(user)
    else
      render :new
    end
  end

  def destroy
    log_out if current_user.present?
    redirect_to root_path
  end

  private def create_params
    params.require(:session).permit(:username, :display_name)
  end
end
