class UsersController < ApplicationController
    get '/signup' do 
        if !logged_in? 
            erb :'/users/signup'
        else 
            redirect '/outfits'
        end 
    end 

    post '/signup' do 
        if params[:username] == "" || params[:email] == "" || params[:password] == "" 
            redirect to '/signup'
        else 
            @user = User.create(params)
            session[:user_id] = @user.id 
            redirect '/outfits'
        end 
    end 

    

end 