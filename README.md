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

### Landing page
  - User is first shown a dialog asking for location permissions
  - If user accepts, we use their co-ordinates and fetch the current location
  - If user rejects we use the base city of Miami as default
  - If user closes the app, if they have shared the location, we we reload the old location, else w fetch the previously search location if it exists
  
  ### First Page
   <img src="https://user-images.githubusercontent.com/10658722/225718621-2cb415f5-69b2-41bb-877d-3f203bf37fce.png" width="300" height="650" />
   
  ### Search query
   <img src="https://user-images.githubusercontent.com/10658722/225718805-bb038fe2-0793-4539-b585-3c35ad1d1507.png" width="300" height="650" />

  ### Results page
  - This page displays the results from the API call
  - If success, the search bar is hidden and result printed, a new search button appears to research
  - if error, an error label displays and allows a user to search again
  
  ### Result page, default
   <img src="https://user-images.githubusercontent.com/10658722/225718857-62bc3d49-1810-4e03-9604-47be3df61509.png" width="300" height="650" />
   
  ### Result page, location based
   <img src="https://user-images.githubusercontent.com/10658722/225718967-67341343-5a76-4ab0-adf5-c14a62d81dce.png" width="300" height="650" />
