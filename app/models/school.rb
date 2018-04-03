class School < ApplicationRecord
    has_many :teachers

	# this item is synced to Salesforce schools using Heroku Connect
	#self.table_name = "salesforce.school__c"
	# self.name = self.organization_name__c
	# self.phone = self.phone__c

	scope :alphabetical, -> {order(:name)}
end
