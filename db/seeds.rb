Arnold = User.create(username: "Arnold", password: "1234")
Ronnie = User.create(username: "theRonnieColeman", password: "1234")
Xena = User.create(username: "Xena_warrior_princess", password: "1234")

PHAT = Program.create(name: "PHAT", days_per_week: 5, user_id: 1)
   sun = Workout.create(day_of_week: "Sunday", program_id: 1)
   mon = Workout.create(day_of_week: "Monday", program_id: 1)
   wed = Workout.create(day_of_week: "Wednesday", program_id: 1)
   thu = Workout.create(day_of_week: "Thursday", program_id: 1)
   fri = Workout.create(day_of_week: "Friday", program_id: 1)

    PHAT_exercises = {
         "Sunday"=>
          [{"name"=>"Pendlay Rows", "sets"=>"3", "reps"=>"3-5", "movement_type" =>"pull"},
           {"name"=>"Weighted Pull-ups", "sets"=>"2", "reps"=>"6-10", "movement_type" =>"pull"},
           {"name"=>"Rack Chins", "sets"=>"2", "reps"=>"6-10", "movement_type" =>"pull"},
           {"name"=>"Bench Press", "sets"=>"3", "reps"=>"3-5", "movement_type" =>"push"},
           {"name"=>"Weighted Dips", "sets"=>"2", "reps"=>"6-10", "movement_type" =>"push"},
           {"name"=>"Seated Shoulder Press", "sets"=>"3", "reps"=>"6-10", "movement_type" =>"push"},
           {"name"=>"Bicep Curls", "sets"=>"3", "reps"=>"6-10", "movement_type" =>"pull"},
           {"name"=>"Skullcrushers", "sets"=>"3", "reps"=>"6-10", "movement_type" =>"push"}],
           "Monday"=>
            [{"name"=>"Squat", "sets"=>"3", "reps"=>"3-5", "movement_type" =>"legs"},
            {"name"=>"Hack Squat", "sets"=>"3", "reps"=>"6-10", "movement_type" =>"legs"},
            {"name"=>"Leg Extension", "sets"=>"2", "reps"=>"6-10", "movement_type" =>"legs"},
            {"name"=>"Romanian Dead Lift", "sets"=>"3", "reps"=>"5-8", "movement_type" =>"legs"},
            {"name"=>"Leg curl", "sets"=>"2", "reps"=>"6-10", "movement_type" =>"legs"},
            {"name"=>"Standing Calf Raise", "sets"=>"3", "reps"=>"6-10", "movement_type" =>"push"},
            {"name"=>"Seated Calf Raise", "sets"=>"2", "reps"=>"6-10", "movement_type" =>"push"}],
            "Wednesday"=>
            [{"name"=>"Pendlay Row", "sets"=>"4", "reps"=>"6-10", "movement_type" =>"pull"},
            {"name"=>"Rack Chin", "sets"=>"3", "reps"=>"10-12", "movement_type" =>"pull"},
            {"name"=>"Seated Cable Row", "sets"=>"3", "reps"=>"10-15", "movement_type" =>"pull"},
            {"name"=>"Dumbell Shrug", "sets"=>"2", "reps"=>"15-20", "movement_type" =>"pull"},
            {"name"=>"Lat Pull", "sets"=>"2", "reps"=>"15-20", "movement_type" =>"pull"},
            {"name"=>"Seated Shoulder Press", "sets"=>"3", "reps"=>"10-12", "movement_type" =>"push"},
            {"name"=>"Upright Row", "sets"=>"2", "reps"=>"10-15", "movement_type" =>"pull"},
            {"name"=>"Lateral Raises", "sets"=>"3", "reps"=>"15-20", "movement_type" =>"pull"},
            {"name"=>"", "sets"=>"", "reps"=>"", "movement_type" =>"push"}],
            "Thursday"=>
            [{"name"=>"Squat", "sets"=>"4", "reps"=>"6-10", "movement_type" =>"legs"},
            {"name"=>"Hack Squat", "sets"=>"3", "reps"=>"10-12", "movement_type" =>"legs"},
            {"name"=>"Leg Extension", "sets"=>"3", "reps"=>"10-15", "movement_type" =>"legs"},
            {"name"=>"Romanian Dead Lift", "sets"=>"3", "reps"=>"10-12", "movement_type" =>"legs"},
            {"name"=>"Leg curl", "sets"=>"3", "reps"=>"10-15", "movement_type" =>"legs"},
            {"name"=>"Standing Calf Raise", "sets"=>"3", "reps"=>"6-10", "movement_type" =>"push"},
            {"name"=>"Seated Calf Raise", "sets"=>"3", "reps"=>"6-10", "movement_type" =>"push"}],
            "Friday"=>
            [{"name"=>"Bench Press", "sets"=>"4", "reps"=>"6-10", "movement_type" =>"push"},
            {"name"=>"Incline Bench", "sets"=>"3", "reps"=>"10-12", "movement_type" =>"push"},
            {"name"=>"Hammer press", "sets"=>"3", "reps"=>"10-15", "movement_type" =>"push"},
            {"name"=>"Cable Flyes", "sets"=>"3", "reps"=>"15-20", "movement_type" =>"push"},
            {"name"=>"Preacher Curls", "sets"=>"3", "reps"=>"10-12", "movement_type" =>"pull"},
            {"name"=>"High Cable Curls", "sets"=>"3", "reps"=>"10-15", "movement_type" =>"pull"},
            {"name"=>"Tricep Extension", "sets"=>"3", "reps"=>"10-12", "movement_type" =>"push"},
            {"name"=>"Tricep Kickback", "sets"=>"3", "reps"=>"10-15", "movement_type" =>"push"}] 
        }
        
    PHAT_exercises.each do |x|
        workout = Workout.find_by_day_of_week(x.first)
            x.last.each do |x|
                workout.exercises.build(x)
            end 
        workout.save 
    end 