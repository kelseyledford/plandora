class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :type

      t.timestamps
    end
  end
end
