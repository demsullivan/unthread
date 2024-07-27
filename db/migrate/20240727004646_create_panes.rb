class CreatePanes < ActiveRecord::Migration[7.1]
  def change
    create_table :panes, id: :uuid do |t|
      t.string :active_tab
      t.jsonb :tabs
      t.uuid :user_id

      t.timestamps
      t.index :user_id
    end
  end
end
