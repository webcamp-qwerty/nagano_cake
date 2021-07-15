class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|

      t.integer :customer_id, null: false, foreign_key: true
      t.string :name, null: false
      t.string :address, null: false
      t.string :postcode, null: false

      t.timestamps null: false
    end
  end
end
