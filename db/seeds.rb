#Create 2 Users

oana = User.create(name: "Oana", email: "oana@oana.com", password: "password")
matt = User.create(name: "Matt", email: "matt@matt.com", password: "password")

RecipeEntry.create(title: "Avocado Salad", ingredients: "avocado, tomato, basil", content: "Mix everything in a bowl with salt, lemon and olive oil", user_id: oana.id)


oana.recipe_entries.create(title: "Mixed Salad", ingredients: "lettuce, tomato", content: "Mix everyhting in a bowl with salt, lemon, olive oil")

matts_entry = matt.recipe_entries.build(title: "Peanut Butter Sandwich", ingredients: "2 sliced of bread, peanut butter, jam", content: "Toast the bread and add the ingredients")
matts_entry.save