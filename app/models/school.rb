class School < ApplicationRecord
  has_many :teachers

	# this item is synced to Salesforce schools using Heroku Connect
	self.table_name = "salesforce.account__c"
	self = self.where(type: "School")
	# self.name = self.organization_name__c
	# self.phone = self.phone__c

	scope :alphabetical, -> {order(:name)}
end
