require 'rack-flash'
class UserController < ApplicationController
    use Rack::Flash


    get '/signup' do 
        erb :'users/new'
    end 

    post '/signup' do 
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

            erb :'users/show'
        else
            redirect '/'
        end 
    end


    private 

    def retrieve_error_message
        error_key = @user.errors.messages.keys[0]
        error_message = @user.errors.messages[error_key][0]
        flash[:message] = error_key.to_s + " " + error_message
    end 
end 