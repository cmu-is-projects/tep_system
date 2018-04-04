class Item < ApplicationRecord
  has_many :order_item
# this model is synced to Salesforce outgoing POS orders using Heroku Connect
	#self.table_name = "salesforce.outgoingposorder"

	validates_presence_of :name, :max_packs, :qty_per_unit, :active
	validates_numericality_of :max_packs, only_integer: true, greater_than: 0
	validates_numericality_of :qty_per_unit, only_integer: true, greater_than: 0

	scope :active, -> {where(active: true)}
	scope :inactive, -> {where(active: false)}
	scope :alphabetical, ->{order(:name)}

end
