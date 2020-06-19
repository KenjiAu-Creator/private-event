class Event < ApplicationRecord
    scope :future, -> (time) {where("created_at > ?", time)}
    scope :past, -> (time) {where("created_at < ?", time)}

    belongs_to :creator, class_name: "User"
    has_many :invitations, foreign_key: "attended_event_id"
    has_many :attendees, through: :invitations, source: :attendee
end
