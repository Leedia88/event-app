module UsersHelper

    def is_admin?(event)
        current_user == Event.admin
    end

end
