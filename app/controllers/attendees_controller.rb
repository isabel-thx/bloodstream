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

	def send_sms
		@user = User.all
		@client = Twilio::REST::Client.new(
		ENV['TWILIO_ACC_SID'], ENV['TWILIO_AUTH_TOKEN']
		)
		@user.each do |user|
		@client.api.account.messages.create(
		  from: ENV['TWILIO_PHONE_NUMBER'],
		  to: "+6" + user.phone_number,
		  body: 'Hello from BloodStream! We are in urgent need of Blood Type X. Please notify your family and friends and contact us if you can help.BloodStream Team.Live Longer.Together.'
		)
		end
		redirect_to root_path
		flash[:notice] = 'SOS message sent.'

	end



	private

    def attendee_params
        params.require(:attendee).permit(:code, :points, :user_id, :event_id)
    end


end
