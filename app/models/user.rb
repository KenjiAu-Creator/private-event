class User < ApplicationRecord
    has_many :hosted_event, foreign_key: "creator_id", class_name: "Event"
end
