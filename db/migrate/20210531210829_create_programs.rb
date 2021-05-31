class CreatePrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :programs do |t|
      t.string :name
      t.integer :days_per_week
      t.integer :user_id
    end 
  end
end
