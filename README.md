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

1. User Model
Attributes:
-name
-email
-password(if I use bcrypt this will be the password_digest in the DB)
-

2. Recipe Entry Model
Attributes:
-title
-ingredients
-content
-user_id <= this will be the foreign key

The User has_many :recipe_entries
A Recipe entry belongs_to :user

MVP
-Users can signup, login, logout, create recipe entries, edit their own entries and view their entries.

Stretch Goals:
-CSS
-include a join model - include a Recipe model where a user can categorise the recipe entries.


LICENCE 

Copyright <2020> <OanaMariaB>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

