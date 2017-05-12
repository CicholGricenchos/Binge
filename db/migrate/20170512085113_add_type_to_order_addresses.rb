class AddTypeToOrderAddresses < ActiveRecord::Migration[5.0]
  def change
    add_column :order_addresses, :type, :string
  end
end
