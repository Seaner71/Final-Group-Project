class AddAttachmentAvatarToQuestions < ActiveRecord::Migration[5.1]
  def self.up
    change_table :questions do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :questions, :avatar
  end
end
