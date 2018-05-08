class Item < ApplicationRecord
	include RailsSortable::Model

	# sync to Salesforce POS Transactions using Heroku Connect
	if sync_to_salesforce? then 
	  has_many :order_items, primary_key: :sfid

	  self.table_name = "items_view"
	  self.primary_key = "sfid" 

	  # The related Outgoing POS Transaction ID 
	  # (in Salesforce it is actually called name)
	  # is stored in the field called pos_trans_id
  else 
  	has_many :order_items
  end 

	validates_presence_of :name, :qty_per_unit
	validates_numericality_of :max_packs, only_integer: true, greater_than_or_equal_to: 0, allow_blank: true
	validates_numericality_of :qty_per_unit, only_integer: true, greater_than: 0

	scope :active, -> {where(active: true)}
	scope :inactive, -> {where(active: false)}
	scope :alphabetical, ->{order(:name)}

	set_sortable :sort  # Indicate a sort column
 
	def self.get_items_with_unique_names
		Item.order(:name, :qty_per_unit).uniq(&:name)
	end 

	def self.pos_transaction_ids_for(name)
		Item.where(name: name).map(&:pos_trans_id)
	end 

end
