class UserController < ApplicationController

    get '/signup' do 
        erb :'users/new'
    end 

    get '/login' do
        erb :'users/login'
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


end 