class AddLayoutToPane < ActiveRecord::Migration[7.1]
  def change
    add_column :panes, :layout, :integer, null: true
  end
end
