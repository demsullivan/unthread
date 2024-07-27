class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by(create_params) do |u|
      u.create_viewport(active_tab: "chat", tabs: [{ name: "Chat", id: "chat", closeable: false }])
    end

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
