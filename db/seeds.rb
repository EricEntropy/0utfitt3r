users_list = {
    "ERIC" => {
        :email => "first_Email", 
        :password_digest => "WHATEVER"
    },
    "Soraya" => {
        :email => "second_Email", 
        :password_digest => "WHATEVERZ"
    }
}

users_list.each do |username, hash|
    user = User.new
    user.username = username
    hash.each do |attribute, value|
        user[attribute] = value
    end 
    user.save
end 

outfit_list = {
    "First_outfit" => {
        :tops => "black shirt", 
        :bottoms => "jeans"
    },
    "Second_outfit" => {
        :tops => "red shirt", 
        :bottoms => "sweatpants"
    }
}
outfit_list.each do |name, hash|
    fit = Outfit.new
    fit.name = name
    hash.each do |attribute, value|
        fit[attribute] = value
    end 
    fit.save
end 