class OutfitsController < ApplicationController

    get '/outfits' do 
        if !logged_in? 
            redirect '/login'
        else 
            @outfits = Outfit.all
            erb :'/outfits/outfits'
        end 
    end 

    get '/outfits/new' do 
        if !logged_in? 
            redirect '/login'
        else
            erb :'/outfits/new' 
        end 
    end 

    post '/outfits' do 
        if logged_in? 
            if params[:name] == ""
                redirect to '/outfits/new'
            else 
                @outfit = current_user.outfits.build(params)
                @outfit.save
                if @outfit.save
                    redirect to "/outfits/#{@outfit.id}"
                else 
                    redirect to '/outfits/new'
                end
            end 
        else 
            redirect '/login'
        end 
    end 

    get '/outfits/:id' do 
        if !logged_in? 
            redirect '/login'
        else
            @outfit = Outfit.find(params[:id])
            erb :'/outfits/show'
        end 
    end 

    get '/outfits/:id/edit' do 
        if !logged_in? 
            redirect '/login'
        else
            @outfit = Outfit.find(params[:id])
            erb :'/outfits/edit'
        end 
    end 

    post '/outfits/:id/edit' do
        if !logged_in? 
            redirect '/login'
        else
            @outfit = Outfit.find(params[:id])
            if !params[:name] == ""
                redirect to "/outfits/#{@outfit.id}/edit"
            else 
                binding.pry
                @outfit.name = params[:name]
                @outfit.tops = params[:tops]
                @outfit.bottoms = params[:bottoms]
                @outfit.save
                redirect to "/outfits/#{@outfit.id}"
            end 
        end 
    end 

    post '/outfits/:id/delete' do
        if !logged_in? 
            redirect '/login'
        else
            @outfit = Outfit.find(params[:id])
            if @outfit.user_id == current_user.id
                @outfit.delete
                redirect to '/outfits'
            else 
                erb :'/outfits/error'
            end 
        end 
    end 
end 