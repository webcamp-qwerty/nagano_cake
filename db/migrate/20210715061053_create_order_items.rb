class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      
      t.integer :item_id, null: false
      t.integer :order_id, null: false
      t.integer :item_count, null: false
      t.integer :make_status, null: false, default: 0
      t.integer :purchase_price, null: false
      
      t.timestamps null: false
    end
  end
end
