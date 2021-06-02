class ProgramController < ApplicationController

    get '/programs' do 
        erb :'programs/index'
    end 

    get '/programs/new' do 
        erb :'programs/new'
    end 

    post '/programs' do 
        session[:days] = params[:days_per_week].to_i
        if params[:workout] == nil 
            redirect '/programs/new'
        end 
    end 

end 