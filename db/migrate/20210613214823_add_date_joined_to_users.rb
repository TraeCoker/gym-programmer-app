class AddDateJoinedToUsers < ActiveRecord::Migration[5.2]
    def change
      add_column :users, :date_joined , :string  
    end
  end 