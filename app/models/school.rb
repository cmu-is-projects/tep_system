class School < ApplicationRecord
  has_many :teachers

  # use the initialize method to do the usual Rails setup but also filter the records for schools 
  def initialize
	  super  # need to do this so other parts of AR's initialize method run first
	  # self = self.where(type: "School") # does this work? 'type' used to be a reserved word in earlier Rails
	  # or 
	  # self = self.select{ |data| data.type == "school" }

	  # we only want schools 
	  # delete and delete_all which won't enforce :before_destroy 
	  # and :after_destroy callbacks or any dependent association options.
	  # self.table_name = "salesforce.account"
	  
	  # alias_attribute :org_type, :type
	  # School.where(org_type: "School").delete_all
	  # School.select{|data| data.type != "School"}.delete_all
  end
	
  # other option is simply to create a scope that has to be called each time, e.g.,
  # def self.all_schools
	 #  self = self.where(type: "School")
  # end

	# this item is synced to Salesforce schools using Heroku Connect
	self.table_name = "salesforce.account"
	self.primary_key = "sfid"
	# self = self.where(type: "School")
	# self.name = self.organization_name__c
	# self.phone = self.phone__c

	scope :alphabetical, -> {order(:name)}
end
