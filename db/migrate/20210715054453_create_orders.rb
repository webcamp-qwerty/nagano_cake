class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer :customer_id, null: false
      t.integer :delivery_charge, null: false
      t.integer :payment, null: false
      t.integer :payment_method, null: false, default: 0
      t.string :name, null: false
      t.string :address, null: false
      t.string :postcode, null: false
      t.integer :order_status, null: false, default: 0

      t.timestamps null: false
    end
  end
end
