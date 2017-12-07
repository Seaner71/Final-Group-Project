class CreateSearch < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.integer :user_id
      t.integer :question_id
      t.integer :answer_id
      t.integer :blog_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
