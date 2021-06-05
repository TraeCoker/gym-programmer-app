class WorkoutExercise < ActiveRecord::Base 
    belongs_to :workout 
    belongs_to :exercise, dependent: :destroy 
end 