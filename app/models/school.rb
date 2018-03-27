class School < ApplicationRecord
    has_many :teachers

	# this item is synced to Salesforce schools using Heroku Connect
	
end
