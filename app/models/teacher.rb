class Teacher < ApplicationRecord
  belongs_to :school  

  # this item is synced to Salesforce teachers using Heroku Connect
  self.table_name = "salesforce.teacher__c"

  scope :alphabetical, ->{order(:last_name, :first_name)}
  scope :for_school, ->(school_sfid){where(XXX: school_sfid)}

  def name
  	"#{last_name}, #{first_name}"
  end
end
