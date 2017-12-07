class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.text :body
      t.references :blog, foreign_key: true

      t.timestamps
    end
  end
end
