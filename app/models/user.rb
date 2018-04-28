# Snagged from PATS 2 by Prof H
class User < ApplicationRecord

    has_secure_password
    has_many :orders


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
    def self.authenticate(username, pwd)
        #find_by_username(email).try(:authenticate, password)
        redirect_url= "urn:ietf:wg:oauth:2.0:oob" #ENV['REDIRECT_URL']
        client = OAuth2::Client.new(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], :site=>ENV['SITE'])
        tok = client.password.get_token(username, pwd)
        return tok
    end

    # def self.auth_w_oauth2(email, password)
    #     client = OAuth2::Client.new(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], :site=>ENV['SITE'])
    #     tok = client.password.get_token(email, password)
    #     return tok
    # end

    # def has_token?
    #     return :tok.nil?
    # end

    #need method to parse response.body into firstname, lastname, etc etc
    #returns a dict with info
    def parse_user_info(tok)
        response = tok.get('/api/v1/resource_owner', :params => {:nounce => SecureRandom.hex(32)})
        usr_obj = JSON.parse(response.body)
        id = usr_obj["id"]
        first_name = usr_obj["first_name"]
        last_name = usr_obj["last_name"]
        email = usr_obj["email"]
        role = usr_obj["role"]
        return usr_obj
    end

end
