import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:auth_presentation/features/auth/auth_bloc.dart'; // Import your Home Screen
import 'package:auth_presentation/auth_presentation.dart';
import 'package:task_manager/presentation/features/splash/splash_screen.dart';
import 'package:task_manager_task_board_presentation/features/create_task/create_task_screen.dart';
import 'package:task_manager_task_board_presentation/features/view_my_created_tasks/view_my_created_tasks_screen.dart';

class AppRoutes {
  static const splash = '/';
  static const signIn = '/sign-in';
  static const signUp = '/sign-up';
  static const forgotPassword = '/forgot-password';
  static const createUser = '/create-user';
  static const createTask = '/create-task';
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
          state.matchedLocation == AppRoutes.signIn || state.matchedLocation == AppRoutes.signUp || state.matchedLocation == AppRoutes.forgotPassword;

      switch (authState) {
        case InitialAuthState():
          break;
        case LoadingAuthState():
          break;
        case AuthenticatedAuthState():
          if (isLoggingIn || state.matchedLocation == AppRoutes.splash) return AppRoutes.createUser;
          break;
        case NotAuthenticatedAuthState():
          if (!isLoggingIn) return AppRoutes.signIn;
          break;
      }
      return null; // No redirection needed
    },

    routes: [
      // --- PUBLIC ROUTES ---
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => SplashScreen(goToSignIn: () => context.replace(AppRoutes.signIn)),
      ),
      GoRoute(
        path: AppRoutes.signIn,
        builder: (context, state) => SignInScreen(
          goToHomePage: () => context.replace(AppRoutes.home),
          goToSignUpScreen: () => context.replace(AppRoutes.signUp),
          goToForgotPassword: () => context.go(AppRoutes.forgotPassword),
        ),
      ),
      GoRoute(
        path: AppRoutes.signUp,
        builder: (context, state) => SignUpScreen(
          goToSignInScreen: () => context.replace(AppRoutes.signIn),
          goToCreateAccountScreen: () => context.replace(AppRoutes.createUser),
        ),
      ),
      GoRoute(path: AppRoutes.forgotPassword, builder: (context, state) => const ForgotPasswordScreen()),

      // --- ONBOARDING ---
      GoRoute(
        path: AppRoutes.createUser,
        builder: (context, state) => CreateUserScreen(goToHomeScreen: () => context.replace(AppRoutes.home)),
      ),

      // --- PRIVATE ROUTES ---
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => ViewMyCreatedTasksScreen(goToCreateNewTaskScreen: () => context.go(AppRoutes.createTask)),
      ),

      GoRoute(
        path: AppRoutes.createTask,
        builder: (context, state) => CreateTaskScreen(onComplete: () => context.pop()),
      ),
    ],
  );
}

// Helper class to convert Bloc Stream to Listenable for GoRouter
class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;

  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((dynamic _) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
