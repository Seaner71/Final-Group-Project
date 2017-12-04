class AddFieldsToUserModel < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_column :users, :bio, :text
    add_column :users, :location, :string
    add_column :users, :github_url, :string
    add_column :users, :previous_industry, :string
  end
end
