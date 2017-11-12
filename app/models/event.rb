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
	validate :end_date_at_least_same_with_start_date

	geocoded_by :venue
	after_validation :geocode

	def start_date_should_be_after_today
    if start_date <= Date.today
      errors.add(:start_date, "can't be in the past or today")
    end
  end

  def end_date_at_least_same_with_start_date
  	if end_date < start_date
    	errors.add :end_date, "can't be in the past"
  	end
  end

end
