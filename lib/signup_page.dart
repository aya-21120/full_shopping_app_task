
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'test.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() {
    return _SignupPageState();
  }
}

class _SignupPageState extends State<SignupPage> {
  final _keyForm = GlobalKey<FormState>();

  // Each field has its own controller.
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future<void> _signUp() async {
    if (_keyForm.currentState!.validate()) {

      // Update the fake database as required by the task.
      Database.username = _usernameController.text.trim();
      Database.password = _passwordController.text;

      // Save user information locally using SharedPreferences.
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString('username', Database.username);
      await prefs.setString('password', Database.password);

      if (!mounted) return;

      // Show success message.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Account created, please login"),
        ),
      );

      // Return to Login page.
      context.pop();
    }
  }

  // Dispose all controllers.
  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _keyForm,
            child: Column(
              children: [

                // Username field
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: "Username",
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.trim().length < 3) {
                      return "Username must be at least 3 characters";
                    }
                    return null;
                  },
                ),

                // Email field
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty ||
                        !value.contains("@") ||
                        !value.contains(".")) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                ),

                // Password field
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                  ),
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),

                // Confirm Password field
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Confirm Password",
                  ),
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // Submit button
                ElevatedButton(
                  onPressed: _signUp,
                  child: const Text("Sign Up"),
                ),

                // Return to Login
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text("Back to Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
