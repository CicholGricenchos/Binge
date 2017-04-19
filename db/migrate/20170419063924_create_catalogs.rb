class CreateCatalogs < ActiveRecord::Migration[5.0]
  def change
    create_table :catalogs do |t|
      t.string :name
      t.integer :parent_id
      t.timestamps
    end
    add_index :catalogs, :parent_id
  end
end
