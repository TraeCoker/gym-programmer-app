class ProgramController < ApplicationController

    get '/programs' do 
        erb :'programs/index'
    end 

    get '/programs/new' do 
        erb :'programs/new'
    end 

    post '/programs' do
        binding.pry 
        session[:days] = params[:days]
        if params[:workout] == nil 
            redirect '/programs/new'
        end 
    end 

end 