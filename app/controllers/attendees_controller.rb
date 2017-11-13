class AttendeesController < ApplicationController
	
	def index

	end

	def new
		@attendee = Attendee.new(attendee_params)
		@existing = Attendee.find_by(attendee_params)
		if @existing == nil || @existing.user_id != @attendee.user_id
			@attendee.save
			flash[:notice] = "New donor added."
		elsif @existing != nil && @existing.user_id == @attendee.user_id
			flash[:notice] = "This donor is already registered in this event."					
		end		
		redirect_to event_path(@attendee.event_id)
	end


	def create
		@attendee = Attendee.find_by(user_id: params[:attendee][:user_id], event_id: params[:attendee][:event_id])
	    if @attendee.code == nil
		   @attendee.generate
		   @client = Twilio::REST::Client.new(
			ENV['TWILIO_ACC_SID'], ENV['TWILIO_AUTH_TOKEN']
			)
			
			@client.api.account.messages.create(
			  from: ENV['TWILIO_PHONE_NUMBER'],
			  to: "+6" + @attendee.user.phone_number,
			  body: 'Thanks for being a kind soul. This is your reward code from Bloodstream: ' + @attendee.code
			)
			flash[:notice] = 'Code generated and sent.'
		else
			flash[:notice] = "Code already exist."
		end
			redirect_to event_path(@attendee.event_id)
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
			  body: 'Good day! Blood Type X needed urgently. Please contact us if you can help.
			  BloodStream Team.
			  Live Longer.Together.'
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
