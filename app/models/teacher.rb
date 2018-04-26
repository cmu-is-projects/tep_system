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
  scope :for_school, ->(school_sfid){where(XXX: school_sfid)}

  def name
  	"#{last_name}, #{first_name}"
  end

end
