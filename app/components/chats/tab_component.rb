# frozen_string_literal: true

class Chats::TabComponent < AppComponent
  option :pane
  option :tab

  def classes
    pane.active_tab == tab['id'] \
      ? "border-2 border-gray-400 bg-gray-200" \
      : "border-2 border-gray-600 bg-gray-400"
  end
end