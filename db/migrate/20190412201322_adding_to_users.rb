class AddingToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gender, :boolean
    add_column :users, :interests, :string
    add_column :users, :profile_pic, :string
  end
end
