class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :roles, :string
    add_column :users, :username, :string
    add_column :users, :phone_number, :string
    add_column :users, :address, :string
    add_column :users, :LinkedIn_page, :string
    add_column :users, :Facebook_page, :string
    add_column :users, :website, :string
  end
end
