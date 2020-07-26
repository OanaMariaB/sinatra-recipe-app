My Sinatra App

User

I am going to boil a recipe app where a User can create recipe entries. 

 A user will be able to:
- Signup
- Login
- Logout

As a user, I will be able:
- Create a recipe entry
- All all my recipe entries
- Edit my recipe entries
- Delete my recipe entries

Models:
1. User
2. Recipe entry

User Model
Attributes:
-name
-email
-password(if I use bcrypt this will be the password_digest in the DB)
-

Recipe Entry Model
Attributes:
-date
-title
-content
-user_id <= this will be the foreign key

The User has_many :recipe entries
A Recipe entry belongs_to :user

MVP
-Users can signup, login, logout, create recipe entries, edit their own entries and view their entries.

Stretch Goals:
-CSS
-include a join model - include a Recipe model where a user can categorise the recipe entries

