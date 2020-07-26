class CreateRecipeEntries < ActiveRecord::Migration
  def change
    create_table :recipe_entries do |t|
      t.string :title
      t.string :ingredients
      t.string :content
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
