class AttendeesController < ApplicationController
	def index

	end

	def create
		@attendee = Attendee.new(user_id: params[:reward_code][:user_id])
	    if @attendee.save
	    	@attendee.generate
	    	flash[:notice] = "Code generated: " + @attendee.code.to_s
	    	redirect_to "/users"
	    end
	end



	def check
		@attendee = Attendee.find_by(user_id: current_user.id, code: params[:code])
		if @attendee != nil
			current_user.points += 10
			current_user.save
			flash[:notice] = "Code applied lah."
			@attendee.destroy
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
