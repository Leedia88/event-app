class User < ApplicationRecord
    has_many :events, through: :attendances
    has_many :attendances, foreign_key: 'admin_id'

    after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
  
    # validates :email # { case_sensitive: false }, format: { with: /\A[a-zA-Z]+\z/,
        #message: "Format is not an email" }
end
