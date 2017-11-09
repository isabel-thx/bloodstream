class RewardCodesController < ApplicationController
	def index

	end
 
	def create
		@rewardcodes = RewardCode.new(user_id: params[:reward_code][:user_id], event_id: "1")
	    if @rewardcodes.save
	       @rewardcodes.generate
	       flash[:notice] = "Code generated: " + @rewardcodes.code.to_s
	    end
	    	redirect_to "/"
	end
	

	
	def check
		@rewardcodes = RewardCode.find_by(user_id: current_user.id, code: params[:code])
		if @rewardcodes != nil
			current_user.points += 10
			current_user.save
			flash[:notice] = "Code applied lah."
			@rewardcodes.destroy
		else
			flash[:notice] = "Code not found."
		end
		redirect_to current_user
	end
	
	

	private

    def reward_code_params
        params.require(:reward_code).permit(:code, :points, :user_id)
    end


end
