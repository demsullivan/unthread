class AddViewportToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :viewport_id, :uuid
  end
end
