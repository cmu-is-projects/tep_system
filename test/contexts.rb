# require needed files
require './test/sets/transactions'
require './test/sets/transaction_items'
require './test/sets/users'
require './test/sets/teachers'
require './test/sets/schools'
require './test/sets/items'

module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::Transactions
  include Contexts::TransactionItems
  include Contexts::Users
  include Contexts::Teachers
  include Contexts::Schools
  include Contexts::Items
end