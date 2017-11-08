class RewardCode < ApplicationRecord
	belongs_to :user, dependent: :destroy
end
