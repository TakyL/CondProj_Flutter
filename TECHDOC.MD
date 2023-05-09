#Technical documentation
##Base explanation and tree of the project
In Flutter, the "lib" folder refers to the library folder where you store the majority of your app's source code. A Flutter project typically contains several sub-folders under the "lib" folder, such as "screens," "models," and "widgets," each containing relevant code files.

The "lib" folder is where you'll write most of your app's Dart code, including the UI layout and behavior, data models, API integrations, and more. The code files in the "lib" folder are compiled into a library file when you build your app, which is what your app uses to run on the device.

When you create a new Flutter project, you'll see a main.dart file under the "lib" folder, which contains the entry point of your app. This file is where you define the initial widget that is displayed when your app is launched.

Overall, the "lib" folder is a crucial part of a Flutter project, as it contains the core code that makes your app run. Keeping your code organized and well-structured in the "lib" folder can make it easier to develop, maintain, and test your app.

 Here is an overview of the different folders you may see in a Flutter project and what they typically contain:

##db

The db folder typically contains code related to database operations, such as database initialization, creating tables, and querying data.

##int

The int folder contains interfaces, which define the contracts for implementing certain functionality in your app. This helps to decouple your code and make it more modular.
metiers

The metiers folder contains classes related to your app's business logic or job functions. These classes typically implement the interfaces defined in the int folder.
##outils

The outils folder contains utility classes, which are helper classes that provide common functionality that can be reused throughout your app.
validator

The validator folder contains code related to data validation, such as validating user input or form data.
##view

The view folder contains code related to the user interface of your app, including the layout, styling, and behavior of your app's screens. This follows the View part of the MVVM (Model-View-ViewModel) design pattern.
##view model

The view model folder contains classes that define the state and behavior of your app's screens. These classes are responsible for managing the interactions between the View and the Model, and updating the UI accordingly. This follows the ViewModel part of the MVVM design pattern.
##widgets

The widgets folder contains your custom widgets that can be reused throughout your app.
##main

The main file is the entry point of your app, where you can define your app's initial configuration and behavior.
##test

The test folder contains your app's tests, which can help you ensure that your app is working as expected and prevent regressions in your codebase.

By following a consistent folder structure and organizing your code files in a logical way, you can make it easier to maintain your app, collaborate with other developers, and ensure that your codebase remains scalable and modular.

Here is our GitHub Action in order to run every test in the folder to make sure that we track the quality of code.
```
name: Flutter Tests

on:
  push:
    branches: [ main ]

jobs:
  test:
    name: Run unit tests
    runs-on: ubuntu-latest
    steps:
    - name: Checkout code
      uses: actions/checkout@v2
    - name: Setup Flutter
      uses: subosito/flutter-action@v1
      with:
        flutter-version: '3.7.9' # replace with desired Flutter version
    - name: Install dependencies
      run: flutter pub get
    - name: Run tests
      run: flutter test
```
