class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages, id: :uuid do |t|
      t.uuid :sender_id, null: false
      t.uuid :thread_id
      t.string :content

      t.timestamps

      t.index :sender_id
      t.index :thread_id
    end
  end
end
