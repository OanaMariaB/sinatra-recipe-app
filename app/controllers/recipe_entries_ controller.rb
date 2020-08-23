class RecipeEntriesController < ApplicationController

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

    #show page for a recipe entry

    #index route for all recipe entries

end