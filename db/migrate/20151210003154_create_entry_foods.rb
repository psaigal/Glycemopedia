class CreateEntryFoods < ActiveRecord::Migration
  def change
    create_table :entry_foods do |t|
      t.references :entry, index: true, foreign_key: true
      t.references :food, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
