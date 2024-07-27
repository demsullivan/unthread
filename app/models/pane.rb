class Pane < ApplicationRecord
  belongs_to :user
  
  enum layout: { vertical: 0, horizontal: 1 }

  has_many :child_pane_instances,
    class_name: "PaneInstance",
    inverse_of: :parent_pane
  
  has_many :child_panes, through: :child_pane_instances

  accepts_nested_attributes_for :child_pane_instances

  def has_tab?(id)
    tabs.find {|t| t['id'] == id }.present?
  end

  def active_tab_messages
    if active_tab == "chat"
      Message.to_main_chat.backlog
    else
      Message.where(thread_id: active_tab).backlog
    end
  end
end
