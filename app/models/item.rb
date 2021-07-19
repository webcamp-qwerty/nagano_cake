class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_item, dependent: :destroy
  attachment :image
  def add_tax_price
    (self.excluded_price * 1.08).round #税抜き価格から税込み価格を表示させるためのメソッド
  end
  
end
