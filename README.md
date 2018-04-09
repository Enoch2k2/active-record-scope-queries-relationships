### To get started ###
Make sure to have postgres installed. You can install at [here](https://postgresapp.com/)

Run the migrations
```
rake db:create db:migrate && rake db:migrate RAILS_ENV=test
```

### GEMS ###
- devise (for users)
- awesome_print (for pretty irb / pry)
- rails-jquery (for bootstrap)
- gem 'bootstrap-sass', '~> 3.3.7' (for bootstrap)

### Models ###
- User (default devise settings)
  - current_cart_id # every belongs_to association will have the user_id foreign key
- Cart
  - user_id:int # every belongs_to association will have the user_id foreign key
  - status:string default: "open"
- CartItem
  - cart_id:int
  - item_id:int
  - quantity:int default: 1
- Item
  - name:string
  - price:float
  - inventory:int
  - type:string
### ASSOCIATIONS ###
- users
  - has many carts
  - belongs to current cart, associate it's class to Cart
- cart
  - belongs to user
  - has many cart_items
  - has many items, through cart_items
- items
  - has many cart_items
  - has many carts, through cart_items
- cart_items
  - belongs to cart
  - belongs to item

### SCOPES ###
- scope carts that haven't been checked out
- scope items that are in stock
- scope items that are out of stock

### QUERIES ###
- add search button to homepage that allows us to query items for type or name
