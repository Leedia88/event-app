module UsersHelper

    def is_admin?(event)
        current_user == Event.admin
    end

    def is_attending?(event)
        Attendance.where(event_id: event.id, attendee_id: current_user.id).exists?
    end

end
