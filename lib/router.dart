import 'package:go_router/go_router.dart';

import 'login_page.dart';
import 'home_page.dart';
import 'products_page.dart';
import 'signup_page.dart';
import 'test.dart';

// push adds a new page on top of the navigation stack.
// The previous page stays underneath, so pop() can return to it.
//
// go navigates directly to a route and updates the navigation stack.
// It does not simply push a new page on top of the existing stack.

final router = GoRouter(
  initialLocation: "/login",

  redirect: (context, state) {
    var path = state.matchedLocation;

    // Protect all Home routes, including Products.
    // If the user is not logged in, redirect them to Login.
    //
    // Signup must be a top-level route, not inside Home,
    // because a new user should be able to sign up without logging in.

    if (path.startsWith("/home") && !Database.isLoggedIn) {
      return "/login";
    }

    return null;
  },

  routes: [
    GoRoute(
      path: "/login",
      builder: (context, state) => const LoginPage(),
    ),

    // Signup

    GoRoute(
      path: "/signup",
      builder: (context, state) => const SignupPage(),
    ),

    GoRoute(
      path: "/home",
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'products',
          builder: (context, state) => const ProductsPage(),
        ),
      ],
    ),
  ],
);
