CLI APPLICATION

APP TITLE - "INSTAMOOD"

DESCRIPTION
Instamood is a CLI application that allows its users to document how they are feeling throughout the day with a gif and caption that they feel best represents them in that moment. Users can create a simple profile accessed via their chosen username.

USER STORIES
1. Users are able to create a simple profile by entering their chosen username upon first initiation of the app. When returning to the app, the app will recognize that username.
2. Users are able to track their "mood" throughout the day by entering how they're feeling, choosing a corresponding gif from the options available, and adding a caption for that gif.
3.	Users can save each mood they create and retrieve them later using the id generated for each mood.
4. Users can delete previous moods they've created using the mood's id number OR  delete all previous moods created.
5. Users can update the caption on previous moods they've created using the mood's id number.
6.	Users can view all of the moods they've created along with their id numbers and corresponding captions.
7. Users can view all moods posted to the app including those by other users in a "timeline"


STRETCH GOALS
1. User can see moods posted by a particular user.
2. User can like their  moods or the moods of others
3. User is able to rate their experience with Instamood.
4. Instamood is able to store and display all ratings from users.
5. #average_ratings is able to produce an average of all user  ratings that updates whenever new ratings are entered.


APP_CLI METHODS
1. #welcome
    Greets the user. Asks for the user's username and acknowledges users that are returning to the app. If this is the user's first experience with Instamood, it creates a user instance using their input as a argument. This user instance is saved to the database.
2.  #hru (abbreviation - "how are you")
    Helper method that asks they user how they're feeling and displays 10 different emotion options. Prompts the user to make a choice.
3. #main_menu
    Takes the input from #hru and uses it to run #gif_options(see below). Ensures that the input provided by the user can be converted to an integer between 1 and 10.
4. #second_menu
    #ask what they want to do next
    #update_mood
    #delete_moods
    #see moods of other users
    #rate_the_app
    #exit the app
5. #what_next
