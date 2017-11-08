class RewardCodesController < ApplicationController
	def index

	end
 
	def new
		@rewardcodes = RewardCode.new(user_id: current_user.id)
	    if @rewardcodes.save
	    @rewardcodes.generate
	    end
	end
		
	
	
	

	private

    def reward_code_params
        params.require(:reward_code).permit(:code, :points, :user_id)
    end


end
