class ChangePriceFormatInNote < ActiveRecord::Migration
  def change
  	rename_column :notes, :price, :price_string
    add_column :notes, :price, :integer

    Note.reset_column_information
    Note.find_each { |c| c.update_attribute(:price, c.price_string) } 
    remove_column :notes, :price_string
  end

  
end
