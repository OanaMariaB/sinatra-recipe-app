class RecipeEntriesController < ApplicationController

      #index route for all recipe entries
    get '/recipe_entries' do
        @recipe_entries = RecipeEntry.all
        erb :'recipe_entries/index'
      end

    #get recipe_entries/new to render a form to create new entry
    get '/recipe_entries/new' do
        erb :'recipe_entries/new'
    end

    post '/recipe_entries' do
         #post recipe_entries to create a new recipe entry and save it to the DVB
        # post route should not render anything, but to create a new entry and redirect
        #I only want to save the entry if it has title, ingredients, content
        #I also only want to create a recipe entry if the user is logged in
        if !logged_in?
            redirect '/'
        end

        if params[:title] !="" && params[:ingredients] !="" && params[:content] !=""
            @recipe_entry = RecipeEntry.create(title: params[:title], ingredients: params[:ingredients], content: params[:content], user_id: current_user.id)
            redirect "/recipe_entries/#{@recipe_entry.id}"
        else 
          redirect '/recipe_entries/new'
        end  
    end

    get '/recipe_entries/:id' do
    #show page for a recipe entry
        @recipe_entry = RecipeEntry.find(params[:id])
        erb :'/recipe_entries/show'
    end

    get '/recipe_entries/:id/edit' do
        #this route should send us to recipe_entries/edit.erb which will render an edit form
        @recipe_entry = RecipeEntry.find(params[:id])
        if logged_in?
            if @recipe_entry.user == current_user
             erb :'/recipe_entries/edit'
            else
             redirect "users/#{current_user.id}"
            end
        else
            redirect '/'
        end
    end

    patch '/recipe_entries/:id' do
        #this action job is to:
        #1. find the recipe entry
        @recipe_entry = RecipeEntry.find(params[:id])
        #2. update the recipe entry
        if logged_in?
            if @recipe_entry.user == current_user && params[:title] !="" && params[:ingredients] != "" && params[:content] != ""
            @recipe_entry.update(title: params[:title], ingredients: params[:ingredients], content: params[:content])
            #3. redirect to ??
            redirect "/recipe_entries/#{@recipe_entry.id}"
            else
            redirect "users/#{current_user.id}"
            end
        else
         redirect '/'
        end
    end


    delete '/recipe_entries/:id' do
        @recipe_entry = RecipeEntry.find(params[:id])
        if @recipe_entry.user == current_user
            @recipe_entry.destroy
            redirect '/recipe_entries'
        else
            redirect '/recipe_entries'
        end
     end

   



end