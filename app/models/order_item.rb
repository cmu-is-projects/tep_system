class OrderItem < ApplicationRecord
  #Relationships
  belongs_to :order

  if sync_to_salesforce? then 
    belongs_to :item, foreign_key: :item_id, primary_key: :sfid
  else 
    belongs_to :item
  end

  #Validations
  validates_presence_of :order, :item
  validates_numericality_of :quantity, greater_than_or_equal_to: 0
  # validate :item_is_active_in_system
  # maybe write validation for quantity and max_quantity

  # Other methods
  # private
  # def item_is_active_in_system
  #   all_active_items = Item.active.all.map(&:id)
  #   unless all_active_items.include?(self.item_id)
  #     errors.add(:item_id, "is not an active item in DataCat")
  #   end
  # end
end
