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
      
        if params[:update]
            redirect '/programs/new'
        end 

        if params[:days] && clean_exercise_input
            
            if params[:submit] && params[:workout] != {} && !params[:name].blank?

                user = User.find(session[:user_id])
                program = Program.create(name: params[:name], days_per_week: params[:days].count, user_id: user.id) 

                params[:days].each do |day|
                  workout = Workout.new(day_of_week: day, program_id: program.id)
                  workout.exercises.build(params[:workout][day])
                  workout.save
                end

                session[:program_name] = ""
                session[:days] = []
                redirect '/programs'
            end 
        end 
        redirect '/programs/new'
    end 


    private 

    def clean_exercise_input
        params[:days].each do |day|
            #binding.pry
            exercises = params[:workout][day] 
            if exercises 
                exercises.each do |exercise|
                    exercise.delete_if {|key, value| value.blank?}
                end  
                exercises.delete_if &:empty?
            end
        end 
            params[:workout].delete_if {|k, v| v == []}
            #binding.pry
            #params[:workout].delete_if &:empty?
    end


end 