class UsersController < Clearance::UsersController

	before_action :allowed?, only: [:verify]
	before_action :set_user, only: [:show, :edit, :update, :upgrade, :downgrade]

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

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@rewardcodes = RewardCode.new
    # automatically renders template: "users/show" (controller/action)
    # if params[:user_id]


		# @events = @user.user_events.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)

    # else
    #   @events = Event.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    # end
  end

  def edit
    # @user = User.find(params[:id])
  end

  def update
    # @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
      #redirect_to the obejct means goes to the show path of the object
    else
      render :edit
    end
  end

  def upgrade
    @user.admin!
    redirect_to @user
  end

  def downgrade
    @user.donor!
    redirect_to @user
  end

	def verify
		if current_user.donor?
			flash[:notice] = "Sorry. You do not have the permission to verify a donor."
			redirect_to "/"
		else
			@user.update(verified: true)
			flash[:notice] = "This donor has been verified."
			redirect_to "/"
		end
	end


	private
  def user_params
    params[Clearance.configuration.user_parameter] || Hash.new
  end

  def set_user
     @user = User.find(params[:id])
  end

	def allowed?
		return !current_user.donor?
	end

end
