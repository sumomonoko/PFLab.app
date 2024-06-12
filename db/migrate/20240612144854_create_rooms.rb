class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :leader_id, null: false
      t.integer :member_id, null: false

      t.timestamps
    end
  end
end
