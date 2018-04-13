class User < ApplicationRecord
	has_secure_password
	has_many :orders

    validates_presence_of :username, :password_digest

	scope :alphabetical, ->{order(:last_name, :first_name)}

	def name
  	 "#{last_name}, #{first_name}"
    end
end
