class CreatePackingItems < ActiveRecord::Migration
  def change
    create_table :packing_items do |t|
      t.string :name
      t.boolean :is_packed
      t.references :group, index: true

      t.timestamps
    end
  end
end
