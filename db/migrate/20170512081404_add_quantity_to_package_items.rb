class AddQuantityToPackageItems < ActiveRecord::Migration[5.0]
  def change
    add_column :package_items, :quantity, :integer
  end
end
