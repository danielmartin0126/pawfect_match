class Changecolumnname < ActiveRecord::Migration[5.2]
  def change
    rename_column :seekings, :species, :breed
  end
end
