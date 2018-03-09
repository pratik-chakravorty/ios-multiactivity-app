iOS MultiScreen App
Student Name-Pratik Chakravorty   Student Number-117222405

The application is a multi-screen application that presents a list of movies to the user. The user can tap through
each of the movies to know more about them. It uses the TableViewController to present the list of movies to the user.
The application also leverages the use of a custom cell to modify the look of each of the cell in the table-list. Each cell contains an image representing the movie and some text which contains basic movie details like the movie name and the movie director's name. The details for each of the main four screens of the application are as follows-

Screen 1
---------
The first screen basically presents the user with a list of movies. The data for the list is coming from the simple.xml file present in the project directory. The data is parsed and stored in a swift model class which has some getter methods.
These getter methods are then used in the TableViewController to populate the movies array with the different movie details. Finally each of these movie details is added into the customized cell of the tableviewcontroller. So the data is fetched from the xml file and presented to the user in a tableviewcontroller. Next when the user taps on any one of the list names a segue is performed which makes the app to transition to the next screen.

Screen 2
---------
The second screen of the application contains the movie image in a larger size and some information about the movie's ratings especially in movie rating sites like IMDB and rotten tomatoes. Again the data for this rating is coming from the xml file. Now to pass the data to the second screen a global variable is used which tracks the value of 'indexPath.row'.
As we know the value of indexPath.row will change depending upon which list item the user taps. For example if it is the first list item then the value will be 0. Finally there is a button which when tapped will perform another segue and transition to the next screen.

Screen 3
---------
The third screen of the application contains a UITextView and a label. The UITextView provides more text details of the plot of the selected movie. The data for this screen is again fetched from the xml file and stored in a model class. It is retrieved in this class by making use of the global variable that tracks the value of indexPath.row. Finally the screen contains a button which when tapped will lead to the final screen of the application.

Screen 4
---------
The Final screen of the application presents the user with a webview and the webview fetches the wikipedia data for the given movie and shows it to the user. 

Additional Features
--------------------
The application also uses a search filter. This filter is present on the first screen. The idea behind it is that when the user taps on the inputTextLabel they can search for any of the movies present on the list and the filter will present the user with the specific movie cell for which they typed. The filter's implementation involves using another array here it is called a filteredArray and a flag boolean variable called inSearch. If the value of inSearch is true then the data will not be added to the movieData array and passed to the subsequent views using indexPath.row rather the data will be passed to the filteredArray and then the same array will be used to fetch data for the subsequent views. The search filter is using a UISearcBar and it's delegate methods so that when the user submits the query the inSearch flag variable can be changed. 

The application is also using some custom animations in the first screen. As the user scrolls down the tableview cells will slide in and appear. 

