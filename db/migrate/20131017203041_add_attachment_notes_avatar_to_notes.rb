class AddAttachmentNotesAvatarToNotes < ActiveRecord::Migration
  def self.up
    change_table :notes do |t|
      t.attachment :notes_avatar
    end
  end

  def self.down
    drop_attached_file :notes, :notes_avatar
  end
end
