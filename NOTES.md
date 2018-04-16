### GEMS ###
- devise (for users)
- awesome_print (for pretty irb / pry)
- rails-jquery (for bootstrap)
- gem 'bootstrap-sass', '~> 3.3.7' (for bootstrap)

### The different steps on how to create associations
1. **Brain storm about what ownerships**. For example, a user of an E-Commerce website will own a cart that he is using to store items in. That is 3 associations. A user who owns a cart, and a cart who owns items.

2. **Think about how the ownerships apply in code**. Create a NOTES.md and scope out your relationships. For example:
```
user might have many carts and a current_cart (the current_cart would be of the class Cart, so we wouldn't need a new model or migration for this, just somewhere to store it's id.)
carts might have many items and belong to a user
item might have many carts (has many to has many always has a join table)

users_table       carts_table           cart_items_table        items_table
current_cart_id   user_id               cart_id
                                        item_id
```
3. **create your migrations**

4. **think about how the associations are with your models** What belongs_to :model or has_many :models. For example we said the users `has_many :carts`. Don't forget to update your models to show these associations. Scope them first in your NOTES.md since all of your associated details are there. Above we had:
```
user might have many carts
carts might have many items and belong to a user
item might have many carts (has many to has many always has a join table)
```

So we'd then take notes on how to associate these:
```
if a user has many carts and belongs to a current_cart, we would then have:

has_many :carts
belongs_to :current_cart, class_name: "Cart"

# here we are making a user belong to a current cart to where it points to the class of Cart since our current cart would be a cart, that way Active Record knows to associate this Record with the carts table.
```

`belongs_to` and `has_many` I like to think of really smart attr_accessors, not only do they associate the models together given it's relationship in the database. It also gives you methods. `belongs_to :user` would give you the writer / reader methods for `:user` and `:user=`.

### Models ###
- User (default devise settings)

- Cart

- CartItem

- Item

### ASSOCIATIONS ###
- users

- cart

- items

- cart_items


### SCOPES ###
Scoping is where we want to have methods that does a certain query for us. The query might be, out of all the socks we have on file, lets only grab all the red socks.

It might look something like this:
```
In our models item.rb, inside the Item class

scope :red_socks, -> { where(item_type: "socks").where(color: "red")}

# here we are creating a class method for red_socks (Item.red_socks), that will narrow down our query to items that are socks, where it's color is red.
```

### QUERIES ###
Active record is an orm that allows us to query our database with methods:
For example a user wanted to search for an item like macbook pro:

```
params = { search: "Macbook Pro" }

# would look for an item where it's name is Macbook Pro
Item.where(name: param[:search])

# if there are multiples we could limit there search to 10 if we wanted to.
Item.where(name: params[:search]).limit(10)

# What if we wanted to add all of these to the cart?
@cart.update(item_ids: @cart.item_ids.concat(Item.where(name: params[:search]).limit(10).pluck(:id)))

# here we grabbed 10 of the items that has the name of Macbook Pro, once we queried we plucked the id's from those Items, which gives us an array of item ids. Then we updated the cart, with what the item ids the cart originally had, plus the ids of the macbook pros.
```