# frozen_string_literal: true

class Chats::PaneComponent < AppComponent
  option :pane

  def layout_classes
    if pane.vertical?
      "flex flex-row"
    elsif pane.horizontal?
      "flex flex-col"
    end
  end

  def split_pane_path(layout)
    new_child_pane = {
      user_id: pane.user_id,
      active_tab: pane.active_tab,
      tabs: pane.tabs.select { |t| t['id'] == pane.active_tab }
    }

    pane_path(pane,
      pane: {
        layout:,
        tabs:   nil,
        child_pane_instances_attributes: [
          { size: 50, child_pane_attributes: new_child_pane.merge(tabs: pane.tabs) },
          { size: 50, child_pane_attributes: new_child_pane }
        ]
      }
    )
  end

  def child_pane_styles(child_pane)
    if pane.vertical?
      "width: #{child_pane.size}%"
    elsif pane.horizontal?
      "height: #{child_pane.size}%"
    end
  end

  def messages
    @pane.active_tab_messages
  end

  def new_message
    if pane.active_tab == "chat"
      Message.new
    else
      Message.new(thread_id: pane.active_tab)
    end
  end
end