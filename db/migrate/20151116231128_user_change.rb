class UserChange < ActiveRecord::Migration
  def change
    remove_column :users, :name
    remove_column :users, :email
    add_column :users, :username, :string
    change_column :users, :username, :string, null: false
  end
end
