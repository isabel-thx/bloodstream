class AttendeesController < ApplicationController
	def index

	end

	def create
		@attendees = Attendee.new(user_id: params[:reward_code][:user_id])
	    if @attendees.save
	    	@attendees.generate
	    	flash[:notice] = "Code generated: " + @attendees.code.to_s
	    	redirect_to "/tools"
	    end
	end



	def check
		@attendees = Attendee.find_by(user_id: current_user.id, code: params[:code])
		if @attendees != nil
			current_user.points += 10
			current_user.save
			flash[:notice] = "Code applied lah."
			@attendees.destroy
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
