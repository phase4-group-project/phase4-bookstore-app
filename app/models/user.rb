class User < ApplicationRecord
    has_secure_password
    has_many :books
    has_many :orders, dependent: :destroy

    validates :username, { 
        length: { minimum: 5, maximum: 8 }, 
        uniqueness: true,
        presence: true 
    } 

    validates :email, {
        uniqueness: true,
        presence: true
    }

end
