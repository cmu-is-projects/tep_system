class School < ApplicationRecord
  has_many :teachers, primary_key: :sfid

	####### COMMENT OUT IF RUNNING LOCALLY #######
	# this item is synced to Salesforce schools using Heroku Connect
	self.table_name = "schools_view"
	self.primary_key = "sfid"
	##############################################

	scope :alphabetical, -> {order(:name)}
end
