class User < ApplicationRecord
	has_secure_password

	def name
  	"#{last_name}, #{first_name}"
  end
end
