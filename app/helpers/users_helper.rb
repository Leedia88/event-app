module UsersHelper

    def is_admin?(event)
        current_user == event.admin
    end

    def is_attending?(event)
        Attendance.where(event_id: event.id, attendee_id: current_user.id).exists?
    end

    # def stripe_customer_id(user)
    #     att = Attendance.where(attendee_id: user.id)
    #     att.each do |id|
    #       if Attendance.find_by(id).stripe_customer_id!=nil
    #         Attendance.find_by(id).stripe_customer_id
    #       end
    #     end
    # end

    def authenticate_user
        unless user_signed_in?
          flash[:warning] = "Tu dois être connecté pour créer un événement!"
          redirect_to root_path
        end
    end

end
