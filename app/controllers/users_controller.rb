class UsersController < ApplicationController
    get '/signup' do 
        session.clear
        if !logged_in? 
            erb :'/users/signup'
        else 
            redirect '/outfits'
        end 
    end 

    post '/signup' do 
        if params[:username] == "" || params[:email] == "" || params[:password] == "" 
            redirect to '/signup'
        elsif User.find_by(:username => params[:username])
            @taken_name = params[:username]
            erb :'/users/index'
        else 
            @user = User.create(params)
            session[:user_id] = @user.id 
            redirect '/outfits'
        end 
    end 

    get '/login' do 
        if !logged_in? 
            erb :'/users/login'
        else 
            redirect '/outfits'
        end 
    end 

    post '/login' do 
        @user = User.find_by(:username => params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect '/outfits'
        else 
            redirect '/signup'
        end 
    end 

    get '/logout' do 
        if logged_in?
            session.clear 
            redirect '/login'
        elsif !logged_in?
            redirect '/login'
        else 
            redirect '/login'
        end 
    end


end 