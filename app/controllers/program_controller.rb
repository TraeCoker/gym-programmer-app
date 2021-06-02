class ProgramController < ApplicationController

    get '/programs' do 
        erb :'programs/index'
    end 

    get '/programs/new' do 
        erb :'programs/new'
    end 

    post '/programs' do
        session[:program_name] = params[:name]
        session[:days] = params[:days]
    
        if params[:workout] == nil 
            redirect '/programs/new'
        end 

        user = User.find(session[:user_id])
        program = Program.create(name: params[:name], days_per_week: params[:days].count, user_id: user.id) 

        params[:days].each do |day|
            workout = Workout.new(day_of_week: day, program_id: program.id)
            exercises = params[:workout][day]

            exercises.each do |exercise|
                exercise.delete_if {|key, value| value.blank?}
              end  
            exercises.delete_if &:empty?

            workout.exercises.build(exercises)
            workout.save
        end 
        redirect ':/programs'
        end 

end 