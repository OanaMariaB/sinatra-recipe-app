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
       if @user && @user.authenticate(params[:password])
       #log the user in (create the session)
       session[:user_id] = @user.id #actually login the user in 
       #redirect to the users show page
       flash[:message] = "Welcome, #{@user.name}"
       redirect "/users/#{@user.id}"
       else
        flash[:errors] = "Your credentials were invalid! Please sign up or try again."
        #tell the user they entered invalid credential 
        #redirect them to the login page
        redirect '/login'
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
        @user = User.new(params)
        if @user.save
            session[:user_id] = @user.id
            #I want to go to the user show page now
            flash[:message] = "You have succesfully created an account, #{@user.name}!"
            redirect "/users/#{@user.id}"
        else   
            #maybe include a message as a strech goal telling the user there's an error
            flash[:errors] = "Your account creation failure :#{@user.errors.full_messages.to_sentence}!"
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