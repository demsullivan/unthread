class Message < ApplicationRecord
  ################################################################################
  # Associations
  ################################################################################
  belongs_to :sender,          class_name: "User"
  belongs_to :thread,          class_name: "Message", optional: true
  has_many   :thread_messages, class_name: "Message", inverse_of: :thread

  ################################################################################
  # Validations
  ################################################################################
  validates_presence_of :content

  ################################################################################
  # Scopes
  ################################################################################
  scope :to_main_chat, -> { where(thread: nil) }
  scope :backlog,      -> { order('created_at DESC').limit(50).sort_by(&:created_at) }
end
