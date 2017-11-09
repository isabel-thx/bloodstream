class AdminController < ApplicationController

  def show
  	@rewardcodes = RewardCode.new
  end

end
