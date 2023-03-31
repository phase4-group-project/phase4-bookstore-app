class User < ApplicationRecord
    has_secure_password
    has_many :todos
    has_many :books
    has_many :orders, dependent: :destroy
    validates :email,{ 
        presence: true,
        uniqueness: true
    }
end
