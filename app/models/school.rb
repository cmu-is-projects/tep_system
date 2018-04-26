class School < ApplicationRecord

	# sync to Salesforce schools using Heroku Connect
	if sync_to_salesforce? then 
	  has_many :teachers, primary_key: :sfid

		self.table_name = "schools_view"
		self.primary_key = "sfid"
	else 
		has_many :teachers
	end 

	scope :alphabetical, -> {order(:name)}
end
