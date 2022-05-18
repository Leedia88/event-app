class Attendance < ApplicationRecord
    belongs_to :event
    belongs_to :attendee, class_name: "User"
    validates :attendee_id, uniqueness: { scope: :event_id, message: "tu es déjà inscrit"}

    after_create :welcome_event

    def welcome_event
        UserMailer.welcome_event(self).deliver_now
    end

end
