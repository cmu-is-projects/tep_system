class School < ApplicationRecord

	# sync to Salesforce schools using Heroku Connect
	if data_source_exists? "schools_view" then 
	  has_many :teachers, primary_key: :sfid

		self.table_name = "schools_view"
		self.primary_key = "sfid"
	else 
		has_many :teachers
	end 

	scope :alphabetical, -> {order(:name)}
end
