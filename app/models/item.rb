class Item < ApplicationRecord
    has_many :transaction_item
	# this model is synced to Salesforce outgoing POS transactions using Heroku Connect
		self.table_name = "salesforce.outgoingpostransaction"
end
