class ProgramController < ApplicationController

    get '/programs' do 
        erb :'programs/index'
    end 

    get '/programs/new' do 
        erb :'programs/new'
    end 

    post '/programs' do
        
        session[:days] = params[:days]
        if params[:workout] == nil 
            redirect '/programs/new'
        end 
        user = User.find(session[:user_id])
         
        #program = Program.create(name: params[:name], days_per_week: params[:days].count, user_id: user.id)
        
        end 

end 