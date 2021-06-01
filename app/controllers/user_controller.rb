class UserController < ApplicationController

    get '/signup' do 
        erb :'users/new'
    end 

    post '/signup' do 
        user = User.new(params)
         
        if user.save
            session[:user_id] = user.id
            redirect '/'
        else 
            redirect '/signup'
        end 
    end 

    get '/login' do
        erb :'users/login'
    end 

    post '/login' do 
        user = User.find_by_username(params[:username])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect '/'
        end 
            redirect '/login'
    end 

    post '/logout' do 
        sessions.clear
        redirect '/'
    end 
end 