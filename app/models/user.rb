class User < ApplicationRecord
  include Clearance::User

    has_many :authentications, dependent: :destroy
    has_many :events, through: :reward_codes
    has_many :reward_codes

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :blood_type, presence: true
    validates :date_of_birth, presence: true
    validates :phone_number, presence: true
    validates :address, presence: true
    validates :password, presence: true, length:{ 7..20 }
    validates :email, uniqueness: {case_sensitive: false, message: "Error: An account with this email already exists."}
    validates :email, presence: true, format: { with: (/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i),message: "Error: Invalid email format." }

  # declare an enum attribute where the values map to integers in the database, but can be queried by name
  	enum role: [ :donor, :admin ]
    def self.create_with_auth_and_hash(authentication, auth_hash)
      user = self.create!(
        first_name: auth_hash["extra"]["raw_info"]["first_name"],
        last_name: auth_hash["extra"]["raw_info"]["last_name"],
        email: auth_hash["extra"]["raw_info"]["email"],
        password: SecureRandom.hex(3)
      )
      user.authentications << authentication
      return user
    end

    # grab fb_token to access Facebook for user data
    def fb_token
      x = self.authentications.find_by(provider: 'facebook')
      return x.token unless x.nil?
    end
 
end
