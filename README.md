
# Gym Programmer

Gym Programmer is a Sinatra web app for creating, viewing and updating your weekly workout programs.

## Installation

Gym Programmer is available via Heroku at:

https://gym-programmer.herokuapp.com/

## Local Machine Installation

After cloning to a directory on your local machine run
```bash
bundle install
```
followed by 
```bash
rake db:migrate
```
and finally run
```bash
shotgun 
```
In your browser, navigate to localhost:9393 to access the homepage.

## Usage

Upon visiting the homepage new users are invited to sign up while returning users are invited to log in.

<img width="947" alt="git1" src="https://user-images.githubusercontent.com/79291960/124034591-07efbe80-d9c1-11eb-9d94-d7a347dfc689.PNG">

Upon logging in you are taken to your personal profile which displays your workout for the current day (if any) for easy viewing  in the gym and on the go.

<img width="946" alt="git2" src="https://user-images.githubusercontent.com/79291960/124034952-7e8cbc00-d9c1-11eb-8432-9211083b933a.PNG">

Once the workout is complete press "Complete Workout" to add the workout to your tally of completed workouts.

An achievement system as well as a user ranking system are built in to give users a fun encouragement to keep consistent with their exercise routines!

The "programs" tab will give you a news feed like index of all the programs created by all users. You can also visit other user's profiles from here. 

The "new program" tab supplies you with a form to enter a new routine into your repertoire. 

When viewing one of your created programs, you are given the option to either edit or delete said program.

For more information or to see it all in action, here is a full video walkthrough:

https://www.youtube.com/watch?v=RdQ-3BZf8KE


## License
[MIT](https://choosealicense.com/licenses/mit/)