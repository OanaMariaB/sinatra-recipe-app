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

    #this route job is to render the sign up form
    get '/signup' do
        #erb should render a view
        erb :signup
    end

    post '/users' do
        #here is where we will create a new user and persist the new user to the database
        #I only want to persisit an user that has a name, email, password
        if params[:name] !="" && params[:email] !="" && params[:password] !=""
            @user = User.create(params)
            #I want to go to the user show page now
            redirect "/users/#{@user.id}"
        else   
            #maybe include a message as a strech goal telling the user there's an error
            redirect "/signup"
        end
    end

    #user show route
    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        session[:user_id] = @user.id
       erb :'/users/show'
    end

    get '/logout' do
        session.clear
        redirect '/'
    end

end