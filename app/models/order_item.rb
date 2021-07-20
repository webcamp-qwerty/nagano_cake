class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order
  enum make_status: { unable: 0, waiting: 1, production: 2, completed: 3 }
end
