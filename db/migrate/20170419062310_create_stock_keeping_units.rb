class CreateStockKeepingUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :stock_keeping_units do |t|
      t.string :name
      t.string :model
      t.timestamps
    end
  end
end
