json.extract! event, :id, :organizer, :venue, :date, :start_time, :end_time, :latitude, :longitude, :created_at, :updated_at
json.url event_url(event, format: :json)
