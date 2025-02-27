Sports interactive task - cricket app 

Description

project for Skill assessment teast .

How to Run the Project

Follow these steps to set up and run the project:
	1.	Clone the GitHub repository

git clone <repository-url>


	2.	Open the project in Android Studio
	3.	Install dependencies

flutter pub get


	4.	Run the project
	•	Open an emulator or connect a physical device
	•	Use the following command to start the app:

flutter run


	•	For debugging, you can use Android Studio’s Run/Debug feature.

Architecture Used
	•	Clean Architecture: The project follows a structured and maintainable clean architecture approach.

State Management
	•	GetX: Used for efficient state management, dependency injection, and routing.

Network Calls
	•	Dio: Used for handling HTTP requests efficiently.

Dependencies

List the main dependencies used in the project:

dependencies:
  flutter:
    sdk: flutter
  get: ^4.x.x
  dio: ^5.x.x

Folder Structure

lib/
│-- infrastructure /           # repository for api calls 
│-- application/           # business logic and fetch api calls logic 
│-- domain/         # modals to store api responses 
│-- presentation/   # UI components (screens, widgets)
│-- main.dart       # Entry point of the app

