class CreateEditorials < ActiveRecord::Migration
  def change
    create_table :editorials do |t|
      t.string :name
      t.string :description
      t.string :country

      t.timestamps
    end
  end
end
