class User < ApplicationRecord
    has_many :attendances
    has_many :events_attended, through: :attendances, class_name: "Event"
    has_many :events_admin, class_name: "Event"

    after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
    # validates :email # { case_sensitive: false }, format: { with: /\A[a-zA-Z]+\z/,
        #message: "Format is not an email" }
end
