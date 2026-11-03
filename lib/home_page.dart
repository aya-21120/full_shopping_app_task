import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'test.dart';


// The "_" makes the class private to this Dart library.

class HomePage extends StatefulWidget {
const HomePage({super.key});

@override
State<HomePage> createState() {
return _HomePageState();
}
}

class _HomePageState extends State<HomePage> {

@override
void initState() {
super.initState();
print("start Home");
}

@override
void dispose() {
print("finish Home");
super.dispose();
}

@override
Widget build(BuildContext context) {
return Scaffold(
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const Text("welcome to Home Page"),

ElevatedButton(
onPressed: () {
// Logout: update the login status.
Database.isLoggedIn = false;

// Navigate directly to Login.
context.go("/login");
},
child: const Text("Logout"),
),
],
),
),
);
}
}
