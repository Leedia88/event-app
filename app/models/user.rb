class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :attendances
    has_many :events_attended, through: :attendances, class_name: "Event"
    has_many :events_admin, class_name: "Event"
    after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def full_name
     if self.first_name
      self.first_name + " " + self.last_name
     else
      self.email
     end
  end

    # validates :email # { case_sensitive: false }, format: { with: /\A[a-zA-Z]+\z/,
        #message: "Format is not an email" }
end
