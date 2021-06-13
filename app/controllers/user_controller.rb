require 'rack-flash'
class UserController < ApplicationController
    use Rack::Flash


    get '/signup' do 
        erb :'users/new'
    end 

    post '/signup' do 
        months = ["January", "February", "March", "April", "May", "June", "July",
                  "August", "Sepetember", "October", "November", "December"]

        params[:completed_workouts] = 0
        params[:date_joined] = "#{months[Time.now.month - 1]}, #{Time.now.year}"
        @user = User.new(params)
        
        if @user.save
            session[:user_id] = @user.id
            redirect "/user/#{@user.username}"
        else 
            retrieve_error_message
            redirect "/signup"
        end 
    end 

    get '/login' do
        erb :'users/login'
    end 

    post '/login' do 
        user = User.find_by_username(params[:username])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect "/user/#{user.username}"
        end
            flash[:message] = "invalid username or password"
            redirect "/login"
    end 

    get '/logout' do 
        session.clear
        redirect '/'
    end 

    get '/user/:username' do 
        redirect_if_not_logged_in
        @user = User.find_by_username(params[:username])
        if @user 
            @current_program = @user.programs.last
            @days_of_week = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

            if @current_program
                @todays_workout = @current_program.workouts.find_by(day_of_week: @days_of_week[Time.now.wday])
            end 

            if @user.completed_workouts.between?(0,10)
                @achievement = "New User"
            elsif @user.completed_workouts.between?(10,24)
                @achievement = "Certified Gym Rat"
            elsif @user.completed_workouts.between?(25, 49) 
                @achievement = "Certified BEAST"
            elsif @user.completed_workouts.between?(50, 99)     
                @achievement = "Certified FreakaZoid"
            elsif @user.completed_workouts.between?(100, 499)
                @achievement = "Certified Lethal Weapon"
            elsif @user.completed_workouts >= 500
                @achievement = "Certified LEGEND"
            end

            @rank = User.where("completed_workouts > ?", @user.completed_workouts).count + 1

            erb :'users/show'
        else
            redirect '/'
        end 
    end

    patch '/user/:username' do 
        @user =  User.find_by_username(params[:username])
        if @user = current_user
            @user.most_recent_workout = params.keys[1].gsub(/\s.+/,"")
            @user.completed_workouts += 1
            @user.save(:validate => false)

            redirect "/user/#{@user.username}"
        end 
        redirect "/"
    end 

    private 

    def retrieve_error_message
        error_key = @user.errors.messages.keys[0]
        error_message = @user.errors.messages[error_key][0]
        flash[:message] = error_key.to_s + " " + error_message
    end 
end 