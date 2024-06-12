class CreateDms < ActiveRecord::Migration[6.1]
  def change
    create_table :dms do |t|
      t.integer :user_id, null: false
      t.integer :room_id, null: false
      t.string :message, null: false

      t.timestamps
    end
  end
end
