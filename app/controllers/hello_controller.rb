class HelloController < ApplicationController
  def index
  	@rewardcodes = RewardCode.new
  end
end
