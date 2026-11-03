#آية محمد عوض عبدالقادر

# Flutter Course – Section5 - Task
## Task Completion Report

I have successfully completed the task and implemented the following concepts in the Flutter application:

### 1. Widget Structure
- Created and organized multiple screens using `StatefulWidget`.
- Used `StatelessWidget` where appropriate.
- Implemented widget constructors using `const` and `super.key`.
- Used private classes and variables following Dart naming conventions.

### 2. Keys
- Used `Key` through widget constructors with `super.key`.
- Used `GlobalKey<FormState>` to access and validate form state.
- Connected the form key to the `Form` widget using the `key` property.

### 3. Form Handling and Validation
- Created Login and Sign Up forms.
- Used `TextEditingController` to manage text input.
- Implemented input validation using `validator`.
- Validated username, email, password, and password confirmation.
- Used `obscureText` to hide password input.
- Displayed error messages for invalid inputs.

### 4. Widget Lifecycle
- Implemented `initState()` to initialize the widget.
- Used `dispose()` to release resources.
- Disposed of all `TextEditingController` instances.
- Used `super.initState()` and `super.dispose()` correctly.
- Added print statements to observe widget lifecycle execution.

### 5. Navigation with GoRouter
- Configured application routing using `GoRouter`.
- Set `/login` as the initial route.
- Used `context.push()` to navigate to the SignUp page.
- Used `context.go()` for direct navigation between pages.
- Used `context.pop()` to return to the previous page.
- Implemented nested routes for the Products page.

### 6. Authentication and Route Protection
- Implemented Login and Sign Up functionality.
- Managed login status using `Database.isLoggedIn`.
- Updated username and password after successful registration.
- Implemented a redirect mechanism to protect Home and its nested routes.
- Implemented Logout functionality.

### 7. Local Data Storage
- Integrated the `SharedPreferences` package.
- Saved username and password locally.
- Retrieved saved credentials during login.
- Used asynchronous operations with `async` and `await`.

### 8. User Interface
- Used `Scaffold`, `AppBar`, `Form`, `Column`, and `SingleChildScrollView`.
- Used `TextFormField`, `ElevatedButton`, and `TextButton`.
- Displayed feedback messages using `SnackBar`.
- Applied `const` to eligible widgets to improve code efficiency.

### Conclusion

All required features were implemented successfully, and the application was tested to verify the registration, login, local data storage, navigation, route protection, and logout functionalities.
