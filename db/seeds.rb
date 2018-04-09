# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

item1 = Item.create(name: "Foldgers", price: 5.99, inventory: 12, item_type: "coffee")
item2 = Item.create(name: "Blue T-Shirt", price: 9.99, inventory: 2, item_type: "shirt")
item3 = Item.create(name: "Blue Pants", price: 13.99, inventory: 5, item_type: "pants")
item4 = Item.create(name: "Blue Socks", price: 4.99, inventory: 1, item_type: "socks")
item5 = Item.create(name: "Red Socks", price: 4.99, inventory: 1, item_type: "socks")