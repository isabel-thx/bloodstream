class AdminController < ApplicationController

  def show
  	@users = User.all
  	@rewardcodes = RewardCode.new
  end

end
