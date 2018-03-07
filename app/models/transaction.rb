class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :teacher
end
