class Books < ActiveRecord::Migration
  def change
  	#add_column :books, :editorial_id, :integer
  	rename_column :books, :editorial, :editorial_id
  	change_column :books, :editorial_id, :integer
  	remove_column :books, :author
  end
end
