class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :species
      t.integer :age
      t.string :quote
      t.string :fav_food
      t.timestamps
    end
  end
end
