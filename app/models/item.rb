class Item < ApplicationRecord

	# sync to Salesforce POS Transactions using Heroku Connect
	if self.connection.data_source_exists? "items_view" then 
	  has_many :order_items, primary_key: :sfid

	  self.table_name = "items_view"
	  self.primary_key = "sfid" 

	  # The related Outgoing POS Transaction ID 
	  # (in Salesforce it is actually called name)
	  # is stored in the field called pos_trans_id
  else 
  	has_many :order_items
  end 

	validates_presence_of :name, :max_packs, :qty_per_unit
	validates_numericality_of :max_packs, only_integer: true, greater_than: 0
	validates_numericality_of :qty_per_unit, only_integer: true, greater_than: 0

	scope :active, -> {where(active: true)}
	scope :inactive, -> {where(active: false)}
	scope :alphabetical, ->{order(:name)}
 
	def self.get_active_items_with_unique_names
		Item.active.order(:name, :qty_per_unit).uniq(&:name)
	end 

	def self.pos_transaction_ids_for(name)
		Item.where(name: name).map(&:pos_trans_id)
	end 

end
