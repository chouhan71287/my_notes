class AddUserIdAndNotesTypeIdToNotes < ActiveRecord::Migration
  def change
  	 add_column :notes, :user_id, :integer
  	 add_column :notes, :notes_type_id, :integer
  end
end
