class User < ActiveRecord::Base
  has_many :events, foreign_key: "creator_id"
  has_many :invites, foreign_key: "attendee_id"
  has_many :attended_events, through: :invites

  has_secure_password

  def upcoming_events
    self.attended_events.upcoming 
  end

  def past_events
    self.attended_events.past 
  end

  def attend!(event)
    self.invites.create!(attended_event_id: event.id)
  end

  def attending?(event)
    event.attendees.inlcude?(self)
  end
end
