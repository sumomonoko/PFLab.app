class CreateRelatonships < ActiveRecord::Migration[6.1]
  def change
    create_table :relatonships do |t|
      t.integer :followed_id, null: false
      t.integer :follower_id, null: false

      t.timestamps
    end
  end
end
