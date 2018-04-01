# require needed files
require './test/sets/orders'
require './test/sets/order_items'
require './test/sets/users'
require './test/sets/teachers'
require './test/sets/schools'
require './test/sets/items'

module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::Orders
  include Contexts::OrderItems
  include Contexts::Users
  include Contexts::Teachers
  include Contexts::Schools
  include Contexts::Items
end