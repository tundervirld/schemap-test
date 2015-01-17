class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.date :date_of_birth
      t.integer :number_of_books

      t.timestamps
    end
  end
end
