class AddLinkedInOmniauthToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :ln_uid, :string
    add_column :users, :ln_emalil, :string
    add_column :users, :ln_picture_url, :string
    add_column :users, :ln_location, :string
    add_column :users, :industry, :string
    add_column :users, :ln_public_profile_url, :string
    add_column :users, :ln_token, :string
    add_column :users, :ln_token_expiry, :datetime
  end
end
