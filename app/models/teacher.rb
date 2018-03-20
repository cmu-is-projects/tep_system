class Teacher < ApplicationRecord
  belongs_to :school

  # this item is synced to Salesforce teachers using Heroku Connect
end
