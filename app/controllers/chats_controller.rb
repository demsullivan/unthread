class ChatsController < ApplicationController
  ################################################################################
  # Callbacks
  ################################################################################
  before_action :require_login
  before_action :fetch_thread, if: -> { params[:thread_id].present? }
  before_action :fetch_messages, only: :show

  private def fetch_thread
    @thread = Message.find(params[:thread_id])
  end

  private def fetch_messages
    @messages = if params[:id] == "chat"
      Message.to_main_chat
    else
      Message.where(thread_id: params[:id])
    end
  end 

  ################################################################################
  # Actions
  ################################################################################
  def index
    @users    = User.present
    @messages = Message.to_main_chat.backlog
    @message  = Message.new
  end

  def show
    @messages = @messages.backlog
    @message  = Message.new(thread_id: params[:id] == "chat" ? nil : params[:id])
  end
end
