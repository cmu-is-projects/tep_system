class Teacher < ApplicationRecord
  belongs_to :school, foreign_key: :accountid
  has_many :orders 

  ####### COMMENT OUT IF RUNNING LOCALLY #######
  # this item is synced to Salesforce teachers using Heroku Connect
  self.table_name = "salesforce.contact"
  self.primary_key = "sfid"
  alias_attribute :first_name, :firstname
  alias_attribute :last_name, :lastname
  alias_attribute :school_id, :accountid
  # alias_attribute :email, :email
  # alias_attribute :phone, :phone

  # filter contacts for teachers 
  delete_non_teachers
  ##############################################


  scope :alphabetical, ->{order(:last_name, :first_name)}
  scope :for_school, ->(school_sfid){where(XXX: school_sfid)}

  def name
  	"#{last_name}, #{first_name}"
  end

  private 

  def self.delete_non_teachers
    if Teacher.column_names.include? "title" then 
      Teacher.where("title NOT ILIKE ?", "%teacher%").delete_all
    end 
  end

end
