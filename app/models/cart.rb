class Cart < ApplicationRecord
  belongs_to :user, required: false
  has_many :cart_items
  has_many :items, through: :cart_items
end
