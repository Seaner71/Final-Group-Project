class CreateBlogTaggings < ActiveRecord::Migration[5.1]
  def change
    create_table :blog_taggings do |t|
      t.references :tag, foreign_key: true
      t.references :blog, foreign_key: true

      t.timestamps
    end
  end
end
