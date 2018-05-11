# Snagged from PATS 2 by Prof H
class User < ApplicationRecord

    has_secure_password
    has_many :orders

    # Validations
    # make sure required fields are present
    validates_presence_of :email, :password_digest
    validates :email, presence: true, uniqueness: { case_sensitive: false}
    validates_presence_of :password, :on => :create 
    validates_presence_of :password_confirmation, :on => :create 
    validates_confirmation_of :password, message: "does not match"
    validates_length_of :password, :minimum => 4, message: "must be at least 4 characters long", :allow_blank => true
    validates_inclusion_of :role, in: %w[admin volunteer], message: "is not recognized in the system"

    ROLES = [['admin', :admin],['volunteer', :volunteer]]
    #[['admin', :admin],['manager', :manager],['volunteer', :volunteer],['teacher',:teacher]]

    scope :alphabetical, ->{order(:last_name, :first_name)}

    def name
        "#{last_name}, #{first_name}"
    end

    def full_name
        "#{first_name} #{last_name}"
    end

    def role?(authorized_role)
        return false if role.nil?
        role.downcase.to_sym == authorized_role
    end
  
    # login by email
    def self.authenticate(email, password)
        find_by_email(email).try(:authenticate, password)
    end



end
