class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.integer :question
      t.text :content
      t.integer :votes

      t.timestamps
    end
  end
end
