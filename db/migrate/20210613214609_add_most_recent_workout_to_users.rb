class AddMostRecentWorkoutToUsers < ActiveRecord::Migration[5.2]
    def change
      add_column :users, :most_recent_workout, :string  
    end
  end 