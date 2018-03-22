class TransactionItem < ApplicationRecord
  #Relationships
  belongs_to :transaction
  belongs_to :item

  #Validations
  validates_numericality_of :quantity, greater_than_or_equal_to: 0
  #validate :item_is_active_in_system

  # Other methods
  # private
  # def item_is_active_in_system
  #   all_active_items = Item.active.all.map(&:id)
  #   unless all_active_items.include?(self.item_id)
  #     errors.add(:item_id, "is not an active item in DataCat")
  #   end
  # end
end
