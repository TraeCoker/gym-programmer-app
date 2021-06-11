class AddCompletedWorkoutsToUsers < ActiveRecord::Migration[5.2]
    def change
      add_column :users, :completed_workouts, :integer 
    end
  end 