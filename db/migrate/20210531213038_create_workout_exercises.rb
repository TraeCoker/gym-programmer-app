class CreateWorkoutExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :workout_exercises do |t|
      t.integer :workout_id
      t.integer :exercise_id
    end 
  end
end
