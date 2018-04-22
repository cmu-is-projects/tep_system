class Item < ApplicationRecord
  has_many :order_items

	####### COMMENT OUT IF RUNNING LOCALLY #######
  # this item is synced to Salesforce POS Transactions using Heroku Connect
  self.table_name = "salesforce.contact"
  self.primary_key = "sfid"
  alias_attribute :first_name, :firstname
  alias_attribute :last_name, :lastname
  alias_attribute :school_id, :accountid
  # alias_attribute :email, :email
  # alias_attribute :phone, :phone

  # filter for OUTGOING POS Transactions 
  Teacher.where("title NOT ILIKE ? OR title IS NULL", "%teacher%").delete_all
  ##############################################

	validates_presence_of :name, :max_packs, :qty_per_unit
	validates_numericality_of :max_packs, only_integer: true, greater_than: 0
	validates_numericality_of :qty_per_unit, only_integer: true, greater_than: 0
	validates_uniqueness_of :name

	scope :active, -> {where(active: true)}
	scope :inactive, -> {where(active: false)}
	scope :alphabetical, ->{order(:name)}

end
