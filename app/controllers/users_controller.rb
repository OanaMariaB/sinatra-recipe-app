class UsersController < ApplicationController

    #the purpose of this route is to render the login page(form)
    
    get '/login' do
        erb :login
    end

    #the purpose of this route is to receive the login form, find the user and log the user in
    
    post '/login' do
       #find the user
       @user = User.find_by(email: params[:email])
       #authenticate the user
       if @user.authenticate(params[:password])
       #log the user in (create the session)
       session[:user_id] = @user.id #actually login the user in 
       #redirect to the users show page
       redirect "/users/#{@user.id}"
       else
        #tell the user they entered invalid credential 
        #redirect them to the login page
       end 

    end

    get '/signup' do

    end

    #user show page
    get '/users/:id' do
        "this will be the users show route"
    end

end