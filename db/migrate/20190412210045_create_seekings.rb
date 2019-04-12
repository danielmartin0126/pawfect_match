class CreateSeekings < ActiveRecord::Migration[5.2]
  def change
    create_table :seekings do |t|
      t.integer :seeker_id
      t.string :species
      t.boolean :gender

      t.timestamps
    end
  end
end
