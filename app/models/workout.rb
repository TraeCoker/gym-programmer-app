class Workout < ActiveRecord::Base 
    belongs_to :Program
    has_many :workout_exercises
    has_many :exercises, through: :workout_exercises

end 