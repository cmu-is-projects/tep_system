class ProductMaster < ApplicationRecord
	####### COMMENT OUT IF RUNNING LOCALLY ########
	has_many :items, primary_key: :sfid

	self.table_name = "salesforce.product_master__c"
	self.primary_key = "sfid"
	###############################################
end 