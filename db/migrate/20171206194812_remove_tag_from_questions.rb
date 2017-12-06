class RemoveTagFromQuestions < ActiveRecord::Migration[5.1]
  def change
    remove_column :questions, :tag1, :string
  end
end
