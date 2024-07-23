class ChatController < ApplicationController
  ################################################################################
  # Callbacks
  ################################################################################
  before_action :require_login
  before_action :fetch_thread, if: -> { params[:thread_id].present? }

  private def fetch_thread
    @thread = Message.find(params[:thread_id])
  end

  ################################################################################
  # Actions
  ################################################################################
  def index
    @users    = User.present
    @messages = Message.to_main_chat.backlog
    @message  = Message.new
  end
end
