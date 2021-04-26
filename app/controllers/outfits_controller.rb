class OutfitsController < ApplicationController

    get '/outfits' do 
        if !logged_in? 
            redirect '/login'
        else 
            @outfits = Outfit.all
            erb :'/outfits/outfits'
        end 
    end 
end 