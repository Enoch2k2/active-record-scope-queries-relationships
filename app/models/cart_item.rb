class CartItem < ApplicationRecord
  belongs_to :cart, required: false
  belongs_to :item, required: false
end
