class CreateTeachersView < ActiveRecord::Migration[5.1]
  def change
    say_with_time("Creating Teachers view from Salesforce contacts") do
    	execute <<-SQL
    		CREATE VIEW teachers_view AS 
    			SELECT sfid, firstname as first_name, lastname as last_name, 
    						 accountid as school_sfid, middle_name__c as middle_name, 
    						 phone, email, title
    			  FROM salesforce.contact
    			 WHERE title ILIKE %teacher%; 
		  SQL
		end
  end
end
