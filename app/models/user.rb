class User < ApplicationRecord

    attr_accessor :tok

	has_secure_password
	has_many :orders

    validates_presence_of :username, :password_digest

	scope :alphabetical, ->{order(:last_name, :first_name)}

	def name
  	 "#{last_name}, #{first_name}"
    end

    def self.auth_w_oauth2(email, password)
        client = OAuth2::Client.new(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], :site=>ENV['SITE'])
        :tok = client.password.get_token(email, password)
    end

    def has_token?
        #beginning of json obj looks like this: {"error":"invalid_grant", ...
        return :tok.nil?
    end

    #need method to parse response.body into firstname, lastname, etc etc
    def parse_user_info
        response = tok.get('/api/v1/resource_owner', :params => {:nounce => SecureRandom.hex(32)})
        usr_obj = JSON.parse(response.body)
        id = usr["id"]
        first_name = usr["first_name"]
        last_name = 
        email
        role
    end

end
