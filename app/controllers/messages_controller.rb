class MessagesController < ApplicationController
  before_action :fetch_pane

  private def fetch_pane
    @pane = Pane.find(params.dig(:message, :pane_id))
  end
  
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
