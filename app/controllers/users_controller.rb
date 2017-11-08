class UsersController < Clearance::UsersController
	def index
		@users = User.all
	end

	def user_from_params
  	first_name = user_params.delete(:first_name)
  	last_name = user_params.delete(:last_name)
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    blood_type = user_params.delete(:blood_type)
    date_of_birth = user_params.delete(:date_of_birth)
    phone_number = user_params.delete(:phone_number)
    address = user_params.delete(:address)



    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.first_name = first_name
      user.last_name = last_name
      user.email = email
      user.password = password
      user.blood_type = blood_type
      user.date_of_birth = date_of_birth
      user.phone_number = phone_number
      user.address = address
    end
  end

  def user_params
    params[Clearance.configuration.user_parameter] || Hash.new
  end





end
