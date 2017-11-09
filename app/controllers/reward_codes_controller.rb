class RewardCodesController < ApplicationController
	def index

	end
 
	def create
		@rewardcodes = RewardCode.new(user_id: params[:reward_code][:user_id])
	    if @rewardcodes.save
	    	@rewardcodes.generate
	    	flash[:notice] = "Code generated: " + @rewardcodes.code.to_s
	    	redirect_to "/tools"
	    end
	end
	

	
	def check
		@rewardcodes = RewardCode.find_by(user_id: current_user.id, code: params[:code])
		if @rewardcodes != nil
			current_user.points += 10
			current_user.save
			flash[:notice] = "Code applied lah."
			@rewardcodes.destroy
		else
			@message = "Code not found."
		end
		redirect_to current_user
	end
	
	

	private

    def reward_code_params
        params.require(:reward_code).permit(:code, :points, :user_id)
    end


end
