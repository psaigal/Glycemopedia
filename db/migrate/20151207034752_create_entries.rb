class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.date :created_on
      t.references :user

      t.timestamps null: false
    end
    add_index :entries, [:user_id, :created_on], unique: true
  end
end
