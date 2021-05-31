class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :name 
      t.string :movement_type 
      t.integer :sets 
      t.integer :reps 
    end 
  end
end
