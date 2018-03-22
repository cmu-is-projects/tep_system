class Transaction < ApplicationRecord
  #Relationships
  belongs_to :user
  belongs_to :teacher

  #Validations
  validates_date :shopping_date, on_or_before: lambda { Date.current }
  validates_date :date_entered, on: lambda { Date.current }

  #Scopes
  scope :for_shopping_date, ->(date) { where(shopping_date: date) }
  scope :for_date_entered, ->(date) { where(date_entered: date) }
  scope :for_teacher, ->(teacher_id) { where(teacher_id: teacher_id) }
  scope :chronological, -> { order(date: :desc ) }
  scope :uploaded, -> { where(uploaded: true) }
  scope :not_uploaded, -> { where(uploaded: false) }
end
