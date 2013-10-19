class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :description
      t.string :author
      t.string :notes_type
      t.boolean :publish, :default=>true
      t.string :price
      t.timestamps
    end
  end
end
