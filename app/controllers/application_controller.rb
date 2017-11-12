class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception
  before_action :set_page


def set_page
  @user = User.all
end


  def index
  	@user = User.all
  end

  def new
  	@user = User.where(state: params[:state])
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

  def create
  	@user = User.where()
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
end
