import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:auth_presentation/presentation.dart'; // Ensure AuthBloc is exported here
import 'package:taskmanager/presentation/view_models/auth/auth_bloc.dart'; // Import your Home Screen

class AppRoutes {
  static const splash = '/';
  static const signIn = '/sign-in';
  static const signUp = '/sign-up';
  static const forgotPassword = '/forgot-password';
  static const createUser = '/create-user';
  static const home = '/home';
}

class AppRouter {
  // We need the AuthBloc to listen to state changes
  final AuthBloc authBloc;

  AppRouter(this.authBloc);

  late final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: true,

    // 1. REFRESH LISTENABLE
    // This forces the router to re-evaluate redirection whenever AuthState changes
    refreshListenable: GoRouterRefreshStream(authBloc.stream),

    // 2. REDIRECTION LOGIC (The Guard)
    redirect: (context, state) {
      final authState = authBloc.state;
      final isLoggingIn =
          state.matchedLocation == AppRoutes.signIn ||
              state.matchedLocation == AppRoutes.signUp ||
              state.matchedLocation == AppRoutes.forgotPassword;

      // A. If Unauthenticated -> Force to Sign In
      if (authState is NotAuthenticatedAuthState) {
        return isLoggingIn ? null : AppRoutes.signIn;
      }

      // B. If Authenticated but on a Login page -> Send to Home
      if (authState is AuthenticatedAuthState) {
        if (isLoggingIn || state.matchedLocation == AppRoutes.splash) {
          // Optional: Check if user has a profile (Display Name)
          // If not, send to CreateUserScreen
          // if (authState.user.displayName == null) return AppRoutes.createUser;

          return AppRoutes.home;
        }
      }

      return null; // No redirection needed
    },

    routes: [
      // --- PUBLIC ROUTES ---
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const Scaffold(body: Center(child: CircularProgressIndicator())),
      ),
      GoRoute(path: AppRoutes.signIn, builder: (context, state) => const SignInScreen()),
      GoRoute(path: AppRoutes.signUp, builder: (context, state) => const SignUpScreen()),
      GoRoute(path: AppRoutes.forgotPassword, builder: (context, state) => const ForgotPasswordScreen()),

      // --- ONBOARDING ---
      GoRoute(path: AppRoutes.createUser, builder: (context, state) => const CreateUserScreen()),

      // --- PRIVATE ROUTES ---
      GoRoute(path: AppRoutes.home, builder: (context, state) => const Placeholder()),
    ],
  );
}

// Helper class to convert Bloc Stream to Listenable for GoRouter
class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;

  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}