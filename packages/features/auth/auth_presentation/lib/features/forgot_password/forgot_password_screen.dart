import 'package:core/core.dart'; // Assumes validators
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_kit/loader/_loader.dart';


import 'forgot_password_bloc.dart';
export 'forgot_password_bloc.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Ask GetIt for the ForgotPasswordBloc
      create: (context) => GetIt.I<ForgotPasswordBloc>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Reset Password')),
        body: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
          listener: (context, state) {
            switch (state) {
              case SuccessForgotPasswordState():
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Reset link sent! Check your email.')),
                );
                // Go back to Sign In screen after success
                Navigator.of(context).pop();
                break;
              case ErrorForgotPasswordState():
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.failure.message)),
                );
                break;
              default:
                break;
            }
          },
          builder: (context, state) {
            return switch (state) {
              LoadingForgotPasswordState() => const InfinityLoader(),

            // Show form on Initial or Error (so they can retry)
              InitialForgotPasswordState() || ErrorForgotPasswordState() => _buildForm(context),

            // If success, we pop the screen in the listener, so we can show a loader or nothing here
              SuccessForgotPasswordState() => const InfinityLoader(),
            };
          },
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Text(
              "Enter your email address and we will send you a link to reset your password.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            TextFormField(
              controller: emailController,
              validator: emailValidationError, // Reusing your core validator
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    context.read<ForgotPasswordBloc>().add(
                      InitiateForgotPasswordEvent(
                        EmailAddressValue(emailController.text),
                      ),
                    );
                  }
                },
                child: const Text('Send Reset Link'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}