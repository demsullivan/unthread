class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    enable_extension "pgcrypto"

    create_table :users, id: :uuid do |t|
      t.string :username
      t.string :display_name
      t.boolean :present

      t.timestamps
    end
  end
end
