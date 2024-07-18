class Message < ApplicationRecord
  ################################################################################
  # Associations
  ################################################################################
  belongs_to :sender,          class_name: "User"
  belongs_to :thread,          class_name: "Message", optional: true
  has_many   :thread_messages, class_name: "Message", inverse_of: :thread

  ################################################################################
  # Callbacks
  ################################################################################
  after_create_commit :broadcast_message

  def broadcast_message
    target = thread || "chat"
    Rails.logger.debug("broadcasting to #{target}")
    broadcast_append_to target
  end

  ################################################################################
  # Scopes
  ################################################################################
  scope :to_main_chat, -> { where(thread: nil) }
end
