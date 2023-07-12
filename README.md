# README

Rails version: 7.0.5

Ruby version: 3.1.2

Postgresql version: 1.1

Before starting the rails server, you need to ensure you have a secret key added to your directory. To do so follow these steps:

1. Enter 'bundle exec rake secret' into the console

2. Ensure you have your code editor added to your system path, then type 'EDITOR='code --wait' rails credentials:edit 
//Replace code with whatever editor you use. Code is for VSCode

3. A credentials.yml.enc file will be generated, along with an error in the console asking if you've forgotten your key. Delete the credentials.yml.enc file and rerun the last command.

4. Copy the secret key that we generated in the first step, then in the new credentials.yml.enc file that should now be open and editable, paste it in and assign it to the 'devise_jwt_secret_key' variable. Save the file and close.

5. The console should tell you the file was saved and closed. You can now use 'rails s' to start the rails server.

In order to test, run "rails s" in your terminal while the api is your pwd. This will start the server on port 3001 and you will be able to make API calls. 

This API uses Postgresql for its database. Currently, the database name is GoVibeAPI_development. Ensure you have a database created with this name or the API will not function.

User authentication is served using the devise gem. 

To create a user and login, a POST route to /signup and /login respectively is required. A JWT token will be provided by devise. In order to test the DELETE route, you must copy this token given in the authentication header, then make a DELETE request with the same authentication token in the header.

Favorite items are added, removed and retrieved through the following routes:
    GET 'activities'
    POST 'add-activity'
    DELETE 'remove-activity/:id'

Itinerary items are added, removed and retrieved through the following routes:
    GET 'itineraries' //Current itinerary items
    GET 'archives-itineraries' //Historical itinerary items
    POST 'create-itinerary'
    DELETE 'remove-itinerary/:id' //Does not delete from database, instead changes the archived column from null to true
    PUT 'update-itinerary' //Used for item reordering

The user profile view is served via the GET 'profile/:id' route