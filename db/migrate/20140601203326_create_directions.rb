class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions do |t|
      t.string :name
      t.string :details
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
