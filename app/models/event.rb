class Event < ApplicationRecord
	has_many :users, dependent: :destroy

	validates :organizer, presence: true
	validates :venue, presence: true
	validates :date, presence: true
	validates :start_time, presence: true
	validates :end_time, presence: true
	validate :date_should_be_after_today

	geocoded_by :venue
	after_validation :geocode

	def date_should_be_after_today
    if date <= Date.today
      errors.add(:date, "can't be in the past or today")
    end
  end

end
