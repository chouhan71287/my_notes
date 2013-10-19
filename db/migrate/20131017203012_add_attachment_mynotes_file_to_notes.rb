class AddAttachmentMynotesFileToNotes < ActiveRecord::Migration
  def self.up
    change_table :notes do |t|
      t.attachment :mynotes_file
    end
  end

  def self.down
    drop_attached_file :notes, :mynotes_file
  end
end
