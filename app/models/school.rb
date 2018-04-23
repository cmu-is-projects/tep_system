class School < ApplicationRecord
  has_many :teachers, primary_key: :sfid

	####### COMMENT OUT IF RUNNING LOCALLY #######
	# this item is synced to Salesforce schools using Heroku Connect
	self.table_name = "schools_view"
	self.primary_key = "sfid"
	# self = self.where(type: "School")
	# self.name = self.organization_name__c
	# self.phone = self.phone__c
	##############################################

	scope :alphabetical, -> {order(:name)}
end
