class UsersController < Clearance::UsersController

	before_action :allowed?, only: [:verify]
	before_action :set_user, only: [:show, :edit, :update, :verify, :upgrade, :downgrade]


  def create
    @user = user_from_params

    if @user.save
      WelcomeJob.perform_later(@user.email)
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
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
		state = user_params.delete(:state)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.first_name = first_name
      user.last_name = last_name
      user.email = email
      user.password = password
      user.blood_type = blood_type
      user.date_of_birth = date_of_birth
      user.phone_number = phone_number
      user.address = address
			user.state = state
    end
  end

	def index
		@users = User.all
  	@attendee = Attendee.new
	end

	def show
		@user = User.find(params[:id])

    # automatically renders template: "users/show" (controller/action)
    # if params[:user_id]

		@attended_list = Attendee.where(user_id: @user.id).order('created_at DESC').paginate(:page => params[:page], :per_page => 5)
		# @events = @user.user_events.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)

    # else
    #   @events = Event.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    # end
  end

  def edit
		if User.find(params[:id]) == User.find(current_user.id)
	    @user = User.find(params[:id])
		else
			flash[:notice] = "You are not allow to edit this user."
			redirect_to "/"
		end
  end

  def update
    # @user = User.find(params[:id])
    if @user.update(update_params)
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
			redirect_to "/users"
		else
			@user.update(verified: true)
			flash[:notice] = "This donor has been verified."
			redirect_to "/users"
		end
	end


	private
	def update_params
		params.require(:user).permit(:first_name, :last_name, :blood_type, :date_of_birth, :phone_number, :address, :email, :password, :state)
	end

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
