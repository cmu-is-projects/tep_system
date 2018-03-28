class Item < ApplicationRecord

	# this model is synced to Salesforce outgoing POS transactions using Heroku Connect
	self.table_name = "salesforce.outgoingpostransaction"
end
