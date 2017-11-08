class UsersController < ApplicationController

	before_action :allowed?, only: [:verify]
	before_action :set_user, only: [:show, :edit, :update, :upgrade, :downgrade]

	def index
		@users = User.all
	end
	
	def show
    # @user = User.find(params[:id])
    # automatically renders template: "users/show" (controller/action)
    # if params[:user_id]
      @events = @user.events.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)

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
			flash[:notice] = "Sorry. You do not have the permission to 			verify a donor."
			redirect_to "/"
		else
			@user.update(verified: true)
			flash[:notice] = "This donor has been verified."
			redirect_to "/"
		end
	end

	def allowed?
		return !current_user.donor?
	end

	private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :blood_type, :date_of_birth, :email, :phone_number, :address, :verified, :points)
  end

  def set_user
     @user = User.find(params[:id])
  end

end
