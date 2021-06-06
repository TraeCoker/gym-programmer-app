class ProgramController < ApplicationController

    get '/programs' do
        redirect_if_not_logged_in
        @programs = Program.all
        @users = @programs.collect{|p| User.find(p.user_id).username}
        erb :'programs/index'
    end 

    get '/programs/new' do 
        redirect_if_not_logged_in
        erb :'programs/new'
    end 

    post '/programs' do
        redirect_if_not_logged_in
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
                session[:days] = nil
                redirect "/programs/#{@program.id}"
            end 

        redirect '/programs/new'
    end 

    get '/programs/:id' do 
        redirect_if_not_logged_in
        @program = Program.find(params[:id])

        erb :'programs/show'
    end 

    get '/programs/:id/edit' do 
        redirect_if_not_logged_in
        @program = Program.find(params[:id])
        #session[:days] = @program.workouts.collect{|w| w.day_of_week}
        if @program.user == current_user
            erb :'programs/edit'
        else
            redirect '/programs'
        end 
    end 

    patch '/programs/:id' do 
        redirect_if_not_logged_in
        @program = Program.find(params[:id])
        session[:days] = params[:days]


        if params[:update]
            redirect "/programs/#{@program.id}/edit"
        end 
            
            if valid_entry?
                @program.update(name: params[:name], days_per_week: params[:days].count) 
                if @program.workouts 
                    @program.workouts.each{|w| w.destroy}
                end 

                params[:workout].each do |day, exercise|
                  workout = Workout.new(day_of_week: day, program_id: @program.id)
                  workout.exercises.build(params[:workout][day])
                  workout.save
                end

                session[:program_name] = ""
                session[:days] = nil
                redirect "/programs/#{@program.id}"
            end 

        redirect "/programs/#{@program.id}/edit"
    end

    delete '/programs/:id' do
        redirect_if_not_logged_in 
        @program = Program.find(params[:id])
        @program.delete 
        
        redirect '/programs'
    end

    private 

    def redirect_if_not_logged_in
        redirect '/login' if !logged_in?
    end 
        

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