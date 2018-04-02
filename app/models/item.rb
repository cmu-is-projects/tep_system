class Item < ApplicationRecord
    has_many :order_item
	# this model is synced to Salesforce outgoing POS orders using Heroku Connect
		#self.table_name = "salesforce.outgoingposorder"

		scope :active, -> {where(active: true)}
end
