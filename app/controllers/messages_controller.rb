class MessagesController < ApplicationController
  def create
    if current_user.nil?
      head :not_found
      return
    end

    @message = Message.create(
      sender:  current_user,
      **create_params
    )

    @target = @message.thread&.id || "chat"
  end

  private def create_params
    params.require(:message).permit(:content, :thread_id)
  end
end
