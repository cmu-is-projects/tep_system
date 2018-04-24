class Teacher < ApplicationRecord
  belongs_to :school, foreign_key: :school_sfid
  has_many :orders 

  ####### COMMENT OUT IF RUNNING LOCALLY #######
  # this item is synced to Salesforce teachers using Heroku Connect
  self.table_name = "teachers_view"
  self.primary_key = "sfid"
  ##############################################


  scope :alphabetical, ->{order(:last_name, :first_name)}
  scope :for_school, ->(school_sfid){where(XXX: school_sfid)}

  def name
  	"#{last_name}, #{first_name}"
  end

  private 

  def self.delete_non_teachers
    if Teacher.column_names.include? "title" then 
      Teacher.where("title NOT ILIKE ? OR title IS NULL", "%teacher%").delete_all
    end 
  end

end
