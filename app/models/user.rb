class User < ActiveRecord::Base 
    has_many :programs
    has_many :workouts, through: :programs 
    has_secure_password
end