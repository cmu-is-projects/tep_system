class CreateSchoolsView < ActiveRecord::Migration[5.1]
  def change
    if table_exists? "salesforce.account" then 
      say_with_time("Creating Schools view from Salesforce accounts") do
      	execute <<-SQL
      		CREATE VIEW schools_view AS 
      			SELECT sfid, name, phone, email__c as email
      			  FROM salesforce.account
      			 WHERE LOWER(type) = LOWER('School'); 
  		  SQL
  		end
    end 
  end
end
