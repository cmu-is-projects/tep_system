class Item < ApplicationRecord
  has_many :order_items

	####### COMMENT OUT IF RUNNING LOCALLY #######
	belongs_to :product_master, foreign_key: "product_master__c"

  # this item is synced to Salesforce POS Transactions using Heroku Connect
  self.table_name = "salesforce.pos_transactions__c"
  self.primary_key = "name" # POS Transaction ID 
  alias_attribute :qty_per_unit, :qty_per_unit__c

  def product_name
  	self.product_master.name
  end 

  # filter for OUTGOING POS Transactions 
  Teacher.where("title NOT ILIKE ? OR title IS NULL", "%teacher%").delete_all
  ##############################################

	# validates_presence_of :name, :max_packs, :qty_per_unit
	validates_numericality_of :max_packs, only_integer: true, greater_than: 0
	validates_numericality_of :qty_per_unit, only_integer: true, greater_than: 0
	# validates_uniqueness_of :name

	scope :active, -> {where(active: true)}
	scope :inactive, -> {where(active: false)}
	# scope :alphabetical, ->{order(:name)}
	scope :alphabetical, ->{order(:product_name)}

end
