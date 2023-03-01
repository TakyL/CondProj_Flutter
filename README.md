
# PlanIf

PlanIf is a mobile application that allows users to create and manage events. The app is built using Flutter and Firebase as a backend service.
Features:
- Create events: users can create events by providing details such as name, location, date, time, and description.
- View events: users can view a list of all upcoming events.
- Update events: users can update the details of their own events.
- Delete events: users can delete their own events.
- Sign in/sign up: users can create an account or sign in using their email and password.
- Google Sign in: users can sign in using their Google account.
- Facebook Sign in: users can sign in using their Facebook account.
- Email verification: users receive an email to verify their email address after creating an account.
- Forgot password: users can reset their password if they forget it.
- Responsive UI: the UI is designed to be responsive and adapt to different screen sizes.
## Technologies Used

Flutter: a UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.

Firebase: a platform developed by Google for creating mobile and web applications.

## Dependencies
   [Flutter](https://flutter.dev)

   [Firebase](https://firebase.google.com/)

   [Provider](https://pub.dev/packages/provider)

   [Google sign in](https://pub.dev/packages/google_sign_in)

   [Facebook sign in](https://pub.dev/packages/flutter_facebook_auth)

   [Intl](https://pub.dev/packages/intl)
## Getting started

Clone the repository:

    git clone https://github.com/TakyL/CondProj_Flutter.git

Navigate to the project directory: 
 
    cd PlanIf

Install the dependencies:

    flutter pub get

Create a Firebase project and add the necessary configurations to the project.

Enable Email/Password, Google, and Facebook sign-in methods in the Firebase console.

Run the app:
   
    flutter run

## Usage

The app has a simple and intuitive UI that allows users to create, view, update, and delete events. To create an event, the user needs to provide the name, location, date, time, and description of the event. The app will automatically validate the date and time to ensure that it is a valid date and time.

To view the list of upcoming events, the user needs to go to the home screen. The home screen shows a list of all upcoming events sorted by the event date. The user can click on an event to view its details or swipe left to delete the event.

To update an event, the user needs to click on the edit button on the event details screen. The app will take the user to the update event screen, where the user can modify the event details.

To delete an event, the user needs to swipe left on the event card on the home screen.

The user can sign in or sign up using their email and password. The app will validate the email address during sign-up and send an email verification link to the user's email address. The user can also sign in using their Google or Facebook account.

If the user forgets their password, they can click on the forgot password link on the sign-in screen and reset their password.

## Contributing

Contributions are welcome! If you find a bug or have a feature request, please open an issue or submit a pull request.

## License

PlanIf is released under the XXX License. See LICENSE for details.

## Mermaid JS
graph TD
  A[User Input] --> B(Text Fields)
  B --> C{Input Validation}
  C -- Valid Input --> D(Firebase Authentication)
  D --> E{User Authentication}
  E -- Authenticated --> F(Successful Login)
  E -- Not Authenticated --> G(Unsuccessful Login)
  C -- Invalid Input --> A

This diagram represents the following flow:

    The user provides input, which is entered into text fields.
    The input is validated to ensure it meets certain criteria (such as correct email format, password length, etc.).
    If the input is valid, it is sent to Firebase for authentication.
    Firebase checks whether the user is authenticated or not.
    If the user is authenticated, the login is successful.
    If the user is not authenticated, the login is unsuccessful and the user is prompted to try again.
    If the input is invalid, the user is prompted to re-enter their input.
