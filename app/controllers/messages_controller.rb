class MessagesController < ApplicationController
  def create
    if current_user.nil?
      head :not_found
      return
    end

    Message.create(
      sender:  current_user,
      content: create_params[:content]
    )
  end

  private def create_params
    params.require(:message).permit(:content)
  end
end
