class ProgramController < ApplicationController

    get '/programs' do 
        erb :'programs/index'
    end 

    get '/programs/new' do 
        erb :'programs/new'
    end 

    post '/programs' do 
        
    end 

end 