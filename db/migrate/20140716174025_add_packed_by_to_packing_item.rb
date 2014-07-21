class AddPackedByToPackingItem < ActiveRecord::Migration
  def change
    add_column :packing_items, :packed_by, :string
  end
end
