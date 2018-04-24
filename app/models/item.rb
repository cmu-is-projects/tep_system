class Item < ApplicationRecord
  has_many :order_items, primary_key: :sfid

	####### COMMENT OUT IF RUNNING LOCALLY #######
  # this item is synced to Salesforce POS Transactions using Heroku Connect
  self.table_name = "items_view"
  self.primary_key = "sfid" 

  # The related Outgoing POS Transaction ID (in Salesforce is actually called name)
  # is stored in the field called pos_trans_id
  ##############################################

	validates_presence_of :name, :max_packs, :qty_per_unit
	validates_numericality_of :max_packs, only_integer: true, greater_than: 0
	validates_numericality_of :qty_per_unit, only_integer: true, greater_than: 0

	scope :active, -> {where(active: true)}
	scope :inactive, -> {where(active: false)}
	scope :alphabetical, ->{order(:name)}
 
	def self.get_active_items_with_unique_names
		Item.active.uniq(&:name)
		# Item.active.sort_by{|i| i.name}.sort_by{|i| i.qty_per_unit}.uniq(&:name)
	end 

	def self.pos_transaction_ids_for(name)
		Item.where(name: name).map(&:pos_trans_id)
	end 

end
