class School < ApplicationRecord
    has_many :teachers

	# this item is synced to Salesforce schools using Heroku Connect
	#self.table_name = "salesforce.school"

	scope :alphabetical, -> {order(:name)}
end
