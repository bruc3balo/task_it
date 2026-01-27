import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_kit/loader/_loader.dart';

import 'sign_in_bloc.dart';
export 'sign_in_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({
    required this.goToHomePage,
    required this.goToSignUpScreen,
    required this.goToForgotPassword,
    super.key,
  });

  final Function() goToForgotPassword;
  final Function() goToSignUpScreen;
  final Function() goToHomePage;

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Ask GetIt for the SignInBloc
      create: (context) => GetIt.I<SignInBloc>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Sign In')),
        body: BlocConsumer<SignInBloc, SignInState>(
          listener: (context, state) {
            switch (state) {
              case SuccessSignInState():
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Sign In Successful!')));
                widget.goToHomePage();
                break;
              case ErrorSignInState():
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.failure.toString())));
                break;
              default:
                break;
            }
          },
          builder: (context, state) {
            switch (state) {
              // We show the form in Initial state.
              // Note: If you want the form to reappear after an Error,
              // you might want to add 'case ErrorSignInState():' here as well.
              case InitialSignInState():
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    spacing: 10, // Requires Flutter 3.27+ (or use SizedBox)
                    children: [
                      TextFormField(
                        controller: emailController,
                        validator: emailValidationError,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(labelText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(labelText: 'Password'),
                        obscureText: true,
                      ),
                      const SizedBox(height: 10),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(onPressed: widget.goToForgotPassword, child: const Text("Forgot password?")),
                      ),

                      const SizedBox(height: 10),

                      // ACTION BUTTON
                      ElevatedButton(
                        onPressed: () {
                          // 1. Validate inputs locally before hitting the Bloc
                          String email = emailController.text;
                          if (emailValidationError(email) != null) return;

                          String password = passwordController.text;

                          // 2. Dispatch Event
                          context.read<SignInBloc>().add(InitiateSignInEvent(email: EmailAddressValue(email), password: password));
                        },
                        child: const Text('Sign In'),
                      ),

                      Text("- OR -"),

                      // NAVIGATION LINK
                      TextButton(onPressed: widget.goToSignUpScreen, child: const Text("Don't have an account? Sign Up")),
                    ],
                  ),
                );
              case LoadingSignInState():
                return const InfinityLoader();
              case SuccessSignInState():
                return const Center(child: Text("Sign in success"));
              case ErrorSignInState():
                // In a real app, you might want to return the form here too
                // so the user can fix the error and try again.
                return Center(child: Text(state.failure.message));
            }
          },
        ),
      ),
    );
  }
}
