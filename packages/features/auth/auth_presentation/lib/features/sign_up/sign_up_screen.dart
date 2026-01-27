import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_kit/loader/_loader.dart';

import 'sign_up_bloc.dart';
export 'sign_up_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({required this.goToCreateAccountScreen, required this.goToSignInScreen, super.key});

  final Function() goToSignInScreen;
  final Function() goToCreateAccountScreen;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // The magic happens here: Ask the container for the Bloc
      create: (context) => GetIt.I<SignUpBloc>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Sign Up')),
        body: BlocConsumer<SignUpBloc, SignUpState>(
          listener: (context, state) {
            switch (state) {
              case SuccessSignUpState():
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Sign Up Successful!')));
                widget.goToCreateAccountScreen();
                break;
              case ErrorSignUpState():
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.failure.toString())));
                break;
              default:
                break;
            }
          },
          builder: (context, state) {
            switch (state) {
              case InitialSignUpState():
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    spacing: 10,
                    children: [

                      TextFormField(
                        controller: emailController,
                        validator: emailValidationError,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(labelText: 'Email'),
                      ),

                      TextFormField(
                        controller: passwordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: passwordValidationError,
                        decoration: const InputDecoration(labelText: 'Password'),
                        obscureText: true,
                      ),

                      const SizedBox(height: 10),

                      ElevatedButton(
                        onPressed: () {
                          // Dispatch the event
                          String email = emailController.text;
                          String? emailError = emailValidationError(email);
                          if (emailError != null) return;

                          String password = passwordController.text;
                          String? passwordError = passwordValidationError(password);
                          if (passwordError != null) return;

                          context.read<SignUpBloc>().add(InitiateSignUpEvent(email: EmailAddressValue(email), password: PasswordValue(password)));
                        },
                        child: const Text('Sign Up'),
                      ),

                      Text("- OR -"),

                      TextButton(onPressed: widget.goToSignInScreen, child: Text("Already have an account? Go to sign in screen")),
                    ],
                  ),
                );
              case LoadingSignUpState():
                return InfinityLoader();
              case SuccessSignUpState():
                return Text("Sign up success");
              case ErrorSignUpState():
                return Text(state.failure.message);
            }
          },
        ),
      ),
    );
  }
}
