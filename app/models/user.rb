
class User < ActiveRecord::Base 
    has_many :programs
    has_many :workouts, through: :programs 
    has_secure_password
    validates :username, :password, presence: true 
    validates :username, uniqueness: true 
    validates_format_of :username, with: /\A[-~_.a-zA-Z0-9]+\z/
    mount_uploader :avatar, AvatarUploader
end