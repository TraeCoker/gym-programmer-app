class ProgramController < ApplicationController

    get '/programs' do 
        erb :'programs/index'
    end 


end 