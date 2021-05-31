class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.string :day_of_week
      t.integer :program_id
    end 
  end
end
