class AddUiStateToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :ui_state, :jsonb
  end
end
