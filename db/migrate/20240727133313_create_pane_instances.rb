class CreatePaneInstances < ActiveRecord::Migration[7.1]
  def change
    create_table :pane_instances, id: :uuid do |t|
      t.uuid :parent_pane_id
      t.uuid :child_pane_id
      t.integer :size

      t.timestamps
    end
  end
end
