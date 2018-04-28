# Snagged from PATS 2 by Prof H
class User < ApplicationRecord
<<<<<<< HEAD

    attr_accessor :tok

	has_secure_password
	has_many :orders
=======
    has_secure_password
    has_many :orders
>>>>>>> 5e48e7e4bbf3b05ac74cf6bc85a858729bf8daf6

    # Validations
    # make sure required fields are present
    validates_presence_of :username, :password_digest
    validates :username, presence: true, uniqueness: { case_sensitive: false}
    validates_presence_of :password, :on => :create 
    validates_presence_of :password_confirmation, :on => :create 
    validates_confirmation_of :password, message: "does not match"
    validates_length_of :password, :minimum => 4, message: "must be at least 4 characters long", :allow_blank => true
    validates_inclusion_of :role, in: %w[admin manager volunteer teacher], message: "is not recognized in the system"

    ROLES = [['admin', :admin],['manager', :manager],['volunteer', :volunteer],['teacher',:teacher]]

    scope :alphabetical, ->{order(:last_name, :first_name)}

    def name
        "#{last_name}, #{first_name}"
    end

    def role?(authorized_role)
        return false if role.nil?
        role.downcase.to_sym == authorized_role
    end
  
    # login by username
    def self.authenticate(username, password)
        find_by_username(username).try(:authenticate, password)
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
