class CreateUsersFoods < ActiveRecord::Migration
  def change
    create_table :users_foods do |t|
      t.integer :food_id
      t.integer :user_id
      t.date :date
      t.references :food, :user

      t.timestamps null: false
    end
  end
end
