class UserController < ApplicationController

    get '/signup' do 
        erb :'users/new'
    end 

    post '/signup' do 
        user = User.new(params)
         
        if user.save
            redirect '/'
        else 
            redirect '/signup'
        end 
    end 


end 