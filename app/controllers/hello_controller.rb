class HelloController < ApplicationController
  def index
  	@attendee = Attendee.new
  end
end
