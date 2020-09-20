class RecipeEntriesController < ApplicationController

    get '/recipe_entries' do
        @recipe_entries = RecipeEntry.all
        erb :'recipe_entries/index'
      end

    get '/recipe_entries/new' do
        erb :'recipe_entries/new'
    end

    post '/recipe_entries' do
        redirect_if_not_logged_in

        if params[:title] !="" && params[:ingredients] !="" && params[:content] !=""
            flash[:message] = "Recipe entry suucesfully created."
            @recipe_entry = RecipeEntry.create(title: params[:title], ingredients: params[:ingredients], content: params[:content], user_id: current_user.id)
            redirect "/recipe_entries/#{@recipe_entry.id}"
        else
            flash[:errors] = "Something went wrong." 
            redirect '/recipe_entries/new'
        end  
    end

    get '/recipe_entries/:id' do
        @recipe_entry = RecipeEntry.find(params[:id])
        erb :'/recipe_entries/show'
    end

    get '/recipe_entries/:id/edit' do
        redirect_if_not_logged_in
        @recipe_entry = RecipeEntry.find(params[:id])
            if @recipe_entry.user == current_user
             erb :'/recipe_entries/edit'
            else
             redirect "users/#{current_user.id}"
            end   
    end

    patch '/recipe_entries/:id' do
          redirect_if_not_logged_in
        @recipe_entry = RecipeEntry.find(params[:id])
        
            if @recipe_entry.user == current_user && params[:title] !="" && params[:ingredients] != "" && params[:content] != ""
            @recipe_entry.update(title: params[:title], ingredients: params[:ingredients], content: params[:content])
            redirect "/recipe_entries/#{@recipe_entry.id}"
            else
            redirect "users/#{current_user.id}"
            end
    end
3

    delete '/recipe_entries/:id' do
        @recipe_entry = RecipeEntry.find(params[:id])
        if @recipe_entry.user == current_user
            @recipe_entry.destroy
            flash[:message] = "You have succesfully deleted that entry."
            redirect '/recipe_entries'
        else
            redirect '/recipe_entries'
        end
     end

end