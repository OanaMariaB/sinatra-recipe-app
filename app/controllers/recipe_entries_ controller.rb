class RecipeEntriesController < ApplicationController

    #get recipe_entries/new to render a form to create new entry

    get '/recipe_entries/new' do
        erb :'recipe_entries/new'

    end

    #post recipe_entries to create a new recipe entry
    # post route should not render anything, but to create a new entry and redirect



    #show page for a recipe entry

    #index route for all recipe entries

end