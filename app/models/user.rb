class User < ApplicationRecord
	has_secure_password

	scope :alphabetical, ->{order(:last_name, :first_name)}

	def name
  	"#{last_name}, #{first_name}"
  end
end
