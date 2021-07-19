class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  def sub_total_price
    item.add_tax_price * item_count
  end
end
