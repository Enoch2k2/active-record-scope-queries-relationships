class Item < ApplicationRecord
  has_many :cart_items
  has_many :carts, through: :cart_items

  scope :socks, -> { where(item_type: "socks") }
end
