# WeatherApp

## Setup

  1. Run the App using xcode Version 14.2 or higher
  2. Load the app to xcode and click the run button
  3. No dependencies used - should run out of the box
  4. Run on any iphone device - use the 14 Pro for the optimal experience
  
## Design Structure

1.) Planning Stage (30 mins):

    - Defined the app's requirements, classes, structs, and modules.
    - Created Codeable models to represent weather options.
    
2.) Architectural Design Stage (30 mins):

    - Designed a Model-View-ViewModel (MVVM) architecture to separate the data layer from the UI layer for better debugging and testing.
    - Defined the views and view models.
    - Implemented an API caller class to make HTTP requests to the server.
    - Created a singleton weather manager to handle weather fetching data throughout the app's life-cycle.
    
3.) App Setup Stage (15 mins):

    -  Set up the Xcode project and evaluated if third-party libraries were necessary.
    -  Established the project's file structure.
    
4.) Coding Stage (2 hours 30 mins):

    -  Implemented the user interface (UI) components.
    -  Created the view models to handle the presentation logic of the views.
    -  Connected the views and view models.
    -  Implemented the API call to fetch weather data.
    -  Added the weather manager to update the weather data throughout the app's views.
    -  Wrote unit tests to validate the functionality of the code.
    
### Notes
    - The MVVM architecture was used to enhance testability, separation of concerns, and to facilitate the maintenance of the codebase.
    - The weather manager singleton was added to update the wether andlocation data across the app, which allows the user to make changes in one view and see the updated location throughout the entire app.
    - The weather fetcher manager was added to help test the app's functionality in more detail.
  
## Testing suite
  1. Navigate to the WeatherAppTests
  2. Run the top most test to run entire test suite
 
  
## Pages

App consists of 2 main pages:

