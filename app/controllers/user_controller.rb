class UserController < ApplicationController

    get '/signup' do 
        erb :'users/new'
    end 

    post '/signup' do 
        user = User.new(params)
         
        if user.save
            session[:user_id] = user.id
            redirect "/user/#{user.username}"
        else 
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
            redirect "/login"
    end 

    get '/logout' do 
        session.clear
        redirect '/'
    end 

    get '/user/:username' do 
        redirect_if_not_logged_in
        @user = User.find_by_username(params[:username])

        erb :'users/show'
    end

end 