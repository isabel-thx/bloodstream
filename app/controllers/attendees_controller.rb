class AttendeesController < ApplicationController
	def index

	end

	def create
		@code = Attendee.find_by(user_id: params[:attendee][:user_id], event_id: params[:attendee][:event_id])
	    if @code.code == nil
		   @code.generate
		     flash[:notice] = "Code generated: " + @code.code.to_s
		else
			 flash[:notice] = "Code already exist."
		end
		 redirect_to event_path(@code.event_id)
	end


	def check
		@attendee = Attendee.find_by(user_id: current_user.id)
		if @attendee.code != nil
			current_user.points += 10
			current_user.save
			flash[:notice] = "Code applied."
			@attendee.update(code: nil)
		else
			flash[:notice] = "Code not found."
		end
			redirect_to current_user
	end



	private

    def attendee_params
        params.require(:attendee).permit(:code, :points, :user_id, :event_id)
    end


end
