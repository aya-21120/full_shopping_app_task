
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'test.dart';

// Part 1: Keys
// super.key passes the optional Key from LoginPage to StatefulWidget.
// Flutter uses this key to identify the widget in the widget tree.
//
// Key? key identifies a widget in the widget tree.
// GlobalKey<FormState> (_keyForm) gives us access to the FormState
// so we can validate the form.
//
// Part 2: const
// const creates compile-time constant widgets.
// Flutter can reuse const widgets during rebuilds instead of
// creating new instances, reducing unnecessary work.
//
// Part 3: Private State
// In Dart, "_" makes a class, variable, or method private
// to its library.
// State classes should be private because they are implementation details
// of their widgets.

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _keyForm = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // Check login information.
  Future<void> _inputCheck() async {
    if (_keyForm.currentState!.validate()) {
      final prefs = await SharedPreferences.getInstance();

      // Read saved account information.
      final savedUsername = prefs.getString('username') ?? Database.username;
      final savedPassword = prefs.getString('password') ?? Database.password;

      final username = _usernameController.text.trim();
      final password = _passwordController.text;

      if (username == savedUsername && password == savedPassword) {
        Database.username = savedUsername;
        Database.password = savedPassword;
        Database.isLoggedIn = true;

        if (!mounted) return;

        context.go("/home");
      } else {
        _usernameController.clear();
        _passwordController.clear();

        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Wrong info"),
          ),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    print("start Login");
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();

    print("finish Login");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _keyForm,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: "Username",
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "please enter valid username";
                    }
                    return null;
                  },
                ),

                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                  ),
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return "please enter valid password";
                    }
                    return null;
                  },
                ),

                ElevatedButton(
                  onPressed: _inputCheck,
                  child: const Text("Login"),
                ),

                TextButton(
                  onPressed: () {
                    context.push("/signup");
                  },
                  child: const Text(
                    "Don't have an account? Sign up",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
