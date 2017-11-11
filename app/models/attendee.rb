class Attendee < ApplicationRecord
	belongs_to :user
	belongs_to :event

	def generate
		range = [*'0'..'9',*'A'..'Z',*'a'..'z']
        self.code = Array.new(8){range.sample}.join
        self.save
	end

	def send_now
		@user.each do |s|
		"+6"+ s.phone_number
		end
	end

	

end
