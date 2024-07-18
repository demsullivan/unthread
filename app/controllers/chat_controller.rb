class ChatController < ApplicationController
  before_action :require_login

  def index
    @users    = User.present
    # Only render the last 50 messages upon joining.
    @messages = Message.to_main_chat.order('created_at DESC').limit(50).sort_by(&:created_at)
    @message  = Message.new
  end
end
