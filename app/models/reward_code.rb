class RewardCode < ApplicationRecord
	belongs_to :user
	belongs_to :event
	
	def generate
		range = [*'0'..'9',*'A'..'Z',*'a'..'z']
        self.code = Array.new(8){range.sample}.join
        self.save
	end

end
