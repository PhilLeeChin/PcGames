# README

Welcome to PcGames, this is a web based applications where users can share their favorite games played on PC.
Users are able to add their own games to have feedback from others with comments.

* Ruby version
- ruby 2.6.1

* Deployment instructions
- Install the webpacker gem
- Run bundle install

- App can be started up with running the command 'rails s' after bundle install is complete
- In any web browser load the following page:
    - http://localhost:3000
* Once on the webpage, the users have the following options
- Register
- Login with self created credentials
- Login with Google
    - This is accessible through omniauth setup, granting users ability to login with social accounts
- After login in, users has the option to add their favorite game
    - User have to enter: Game Title, Developer, and Genre of the game
- Once the game is created a user can then add comments
    - Other users can view the game created, and also leave comments
    - Through this users are able to give their feedback on any aspect of the game
    - Users names are shown beside comments for reference
- User can then Sign Out after submission
    - Users do not lose the games that were added, or their comment under the game