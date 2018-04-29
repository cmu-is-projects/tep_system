class Teacher < ApplicationRecord

  # sync to Salesforce teachers using Heroku Connect
  if sync_to_salesforce? then 
    belongs_to :school, foreign_key: :school_sfid
    has_many :orders, primary_key: :sfid 

    self.table_name = "teachers_view"
    self.primary_key = "sfid"
  else 
    belongs_to :school
    has_many :orders
  end 

  scope :alphabetical, ->{order(:last_name, :first_name)}
  scope :for_school, ->(school_sfid){where(school_sfid: school_sfid)}

  def name
  	"#{last_name}, #{first_name}"
  end

  # returns true if school's sfid is a valid school
  # false otherwise 
  # needed because teachers may be in salesforce without 
  # belonging to valid schools but they should still be 
  # able to make orders 
  def belongs_to_valid_school?
    if Teacher.sync_to_salesforce?
      School.exists? sfid
    else 
      School.exists? id
    end
  end 

end
