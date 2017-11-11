class User < ApplicationRecord
  include Clearance::User

    has_many :authentications, dependent: :destroy
    has_many :events, through: :attendees
    has_many :attendees

    validates :first_name, presence: true, on: :update
    validates :last_name, presence: true, on: :update
    validates :blood_type, presence: true, on: :update
    validates :date_of_birth, presence: true, on: :update
    validates :phone_number, presence: true, on: :update
    validates :address, presence: true, on: :update
    validates :password, presence: true, length: { :in => 7..20 }, on: :create
    validates :email, uniqueness: {case_sensitive: false, message: "Error: An account with this email already exists."}
    validates :email, presence: true, format: { with: (/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i),message: "Error: Invalid email format." }

  # declare an enum attribute where the values map to integers in the database, but can be queried by name
  	enum role: [ :donor, :admin ]
    # enum state: [:Kuala Lumpur, ]
    # <option>Kuala Lumpur</option>
    # <option>Selangor</option>
    # <option>Johor</option>
    # <option>Kedah</option>
    # <option>Kelantan</option>
    # <option>Malacca</option>
    # <option>Negeri Sembilan</option>
    # <option>Pahang</option>
    # <option>Perak</option>
    # <option>Perlis</option>
    # <option>Penang</option>
    # <option>Terengganu</option>
    # <option>Sabah</option>
    # <option>Sarawak</option>
    # enum blood_type: [ :'O+', :'O-', :'A+', :'A-', :'B+', :'B-', :'AB+', :'AB-']
    def self.create_with_auth_and_hash(authentication, auth_hash)
      user = self.create!(
        first_name: auth_hash["extra"]["raw_info"]["first_name"],
        last_name: auth_hash["extra"]["raw_info"]["last_name"],
        email: auth_hash["extra"]["raw_info"]["email"],
        password: SecureRandom.hex(10)
      )
      user.authentications << authentication
      return user
    end

    # grab fb_token to access Facebook for user data
    def fb_token
      x = self.authentications.find_by(provider: 'facebook')
      return x.token unless x.nil?
    end
<<<<<<< HEAD

    def self.search(first_name:)
      User.where("(first_name LIKE ?)", "%#{first_name}%")
=======
 
    def self.search(email:)
      User.where("email LIKE ?", "%#{email}%")
>>>>>>> master
    end

end
