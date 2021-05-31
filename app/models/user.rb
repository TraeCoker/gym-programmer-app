class User < ActiveRecord::Base 
    has_many :programs
    has_secure_password
end