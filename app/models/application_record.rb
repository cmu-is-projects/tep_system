class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.sync_to_salesforce? 
  	self.connection.data_source_exists? "salesforce.contact"
  end 
end
