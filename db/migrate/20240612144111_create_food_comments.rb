class CreateFoodComments < ActiveRecord::Migration[6.1]
  def change
    create_table :food_comments do |t|
      t.integer :user_id, null: false
      t.integer :food_id, null: false
      t.string :body, null: false

      t.timestamps
    end
  end
end
