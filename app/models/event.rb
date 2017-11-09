class Event < ApplicationRecord


	has_many :users, through: :attendees
	has_many :attendees
	mount_uploaders :photos, PhotoUploader

	# has_many :user_events, dependent: :destroy

	validates :organizer, presence: true
	validates :venue, presence: true
	validates :start_date, presence: true
	validates :start_time, presence: true
	validates :end_time, presence: true
	validate :start_date_should_be_after_today

	geocoded_by :venue
	after_validation :geocode

	def start_date_should_be_after_today
    if start_date <= Date.today
      errors.add(:start_date, "can't be in the past or today")
    end
  end

end
