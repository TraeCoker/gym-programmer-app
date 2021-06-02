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
            
            if valid_entry?
                user = User.find(session[:user_id])
                @program = Program.create(name: params[:name], days_per_week: params[:days].count, user_id: user.id) 

                params[:workout].each do |day, exercise|
                  workout = Workout.new(day_of_week: day, program_id: @program.id)
                  workout.exercises.build(params[:workout][day])
                  workout.save
                end

                session[:program_name] = ""
                session[:days] = []
                redirect "/programs/#{@program.id}"
            end 

        redirect '/programs/new'
    end 

    get '/programs/:id' do 
        erb :'programs/show'
    end 


    private 

    def clean_exercise_input
        params[:workout].each do |day, exercise|
            exercise.each do |hash|
                hash.delete_if {|k, v| v.blank?} 
            end   
            exercise.delete({})
        end  
            params[:workout] = params[:workout].reject {|k, v| v == []}
    end


    def valid_entry?
        params[:days] && clean_exercise_input && params[:submit] && params[:workout] != {} && !params[:name].blank?
    end

end 