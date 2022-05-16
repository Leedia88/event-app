class User < ApplicationRecord
    has_many :events, through: :attendances
    has_many :attendances

    # validates :email # { case_sensitive: false }, format: { with: /\A[a-zA-Z]+\z/,
        #message: "Format is not an email" }
end
