class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.sync_to_salesforce? 
  	(self.connection.data_source_exists? "salesforce.contact") && 
  	(self.connection.data_source_exists? "salesforce.account") &&
  	(self.connection.data_source_exists? "salesforce.pos_transactions__c" )
  end 
end
