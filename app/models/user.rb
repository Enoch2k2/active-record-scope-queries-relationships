class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #  allows a user to have an array of carts with the getter/setter of #carts
  has_many :carts
  # Rails 5.x default requires you to have an belongs_to association
  belongs_to :current_cart, class_name: "Cart", required: false
end
