class User < ActiveRecord::Base 
    has_many :programs
    has_many :workouts, through: :programs 
    has_secure_password
    validates :username, :password, presence: true 
    validates :username, uniqueness: true 
end