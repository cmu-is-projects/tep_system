class Teacher < ApplicationRecord
  belongs_to :school 
  has_many :orders 
  # before_create :set_school_id

  # this item is synced to Salesforce teachers using Heroku Connect
  # self.table_name = "salesforce.teacher__c"
  # self.first_name = self.first_name__c
  # self.last_name = self.last_name__c 
  # self.school_id = School.find(name: self.primary_affiliation__c).first.id
  # self.email = self.work_email__c
  # self.phone = self.work_phone__c
  # alias_attribute :first_name, :first_name__c
  # alias_attribute :last_name, :last_name__c
  # alias_attribute :school_id, School.find(name: :primary_affiliation__c).first.id
  # alias_attribute :email, :work_email__c
  # alias_attribute :phone, :work_phone__c

  scope :alphabetical, ->{order(:last_name, :first_name)}
  scope :for_school, ->(school_sfid){where(XXX: school_sfid)}

  def name
  	"#{last_name}, #{first_name}"
  end

  private 
  def set_school_id
    self.write_attribute(:school_id, School.find(name: primary_affiliation__c).first.id)
  end 
end
