class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  enum payment_method: { credit_card:0, bank_transfer:1}
  enum order_status: { waiting: 0, confirming: 1, producing: 2, preparing: 3, sent: 4}
end
