class Attendance < ApplicationRecord
    belongs_to :event
    belongs_to :attendee, class_name: "User"

    after_create :welcome_event

    def welcome_event
        UserMailer.welcome_event(self).deliver_now
    end

end
