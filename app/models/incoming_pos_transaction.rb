class IncomingPosTransaction < ApplicationRecord
	# sync to Salesforce schools using Heroku Connect
	if sync_to_salesforce? then 
		self.table_name = "salesforce.pos_transactions__c"
		self.primary_key = "sfid"
	end 
end 

