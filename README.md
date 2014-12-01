== NovoEd Code Challenge - Find a Classmate to Work with!!

I have solved this problem by creating a single page Ruby on Rails app. After downloading the google doc of learner locations as a .csv file, I then read in the file to import into a PostgreSQL database in db/seeds.rb. I used the gem geokit-rails to help parse the locations using Google's Geocoding API.

The User model consists of a user's first name, last name, country, state, and city, and the home page of the site has been set to the user controller's search page. This page contains a select list for choosing the search field and a form for the query, which is case-insensitive and can handle parts of words. The CSS of the page is done using bootstrap.

Bonus: 

A better version of this search would start on the other end by requiring more consistent location input from users. The Geocoder does its best to interpret various location formats, but is far from perfect. Some users provided only a city, making it guesswork to determine where in the world the user is located. These locations could include a (*) to denote that the location is based on incomplete information and is less reliable.

User Story 1: To help students like this find team members to meet with in person, the search could include options for within 'x' number of miles. This option could be implemented by storing the latitude and longitude in the User model and calculating distances. Alternatively, each user could be linked to a Location model table entry that includes all of the geocoding information. A zoomable map could even be generated showing the locations of nearby users.

User Story 2: The student from China who wants to find a remote team would benefit from including additional information in the search. This information could include languages and preferred times to work/collaborate on NovoEd. Even if work is mainly done in English, students might still want to be able to communicate in their dominant language. The model would store all times in GMT so that if the Chinese student prefers to work in the morning she could still work with someone across the world who prefers evenings.

Priority in the search results in both of these cases could be given to other users who are taking other of the same classes currently or in the past, making it more likely they have similar goals and interests. Also, for both of these students to find teams, the search results should include links that allow them to either view more detailed profiles or communicate with other users.

* ...


