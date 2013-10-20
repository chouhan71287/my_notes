class CreateNotesTypes < ActiveRecord::Migration
  def change
    create_table :notes_types do |t|
    	t.string :name
    	t.boolean :available, :default=>true
      t.timestamps
    end
  end
end
