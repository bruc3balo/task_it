import 'package:auth_presentation/presentation.dart'; // Assumes your bloc is exported here
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_kit/loader/_loader.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  final displayNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // 1. Inject Bloc & Trigger the initial check immediately
      create: (context) => GetIt.I<CreateUserBloc>()..add(CheckIfUserHasBeenCreatedEvent()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Create Profile')),
        body: BlocConsumer<CreateUserBloc, CreateUserState>(
          listener: (context, state) {
            switch (state) {
              case SuccessCreateUserState():
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile Created!')));
                // TODO: Navigate to Home Dashboard
                break;
              case AlreadyCreatedUserState():
              // The user already has a profile, skip this screen
              // TODO: Navigate to Home Dashboard
                break;
              case ErrorCreateUserState():
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.failure.message)));
                break;
              default:
                break;
            }
          },
          builder: (context, state) {
            // 2. Decide what to show based on state
            return switch (state) {
            // While checking or submitting, show loader
              InitialCreateUserState() || LoadingCreateUserState() => const InfinityLoader(),

            // If we are ready, or if there was an error (allow retry), show the form
              ReadyToCreateUserState() || ErrorCreateUserState() => _buildForm(context),

            // If success/already created, show nothing (navigation happens in listener)
              SuccessCreateUserState() || AlreadyCreatedUserState() => const SizedBox.shrink(),
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
              "Welcome! Let's set up your profile.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            TextFormField(
              controller: displayNameController,
              validator: displayNameValidationError, // Using the validator from Base/Utils
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                labelText: 'Display Name',
                hintText: 'e.g. Task Master',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    context.read<CreateUserBloc>().add(
                      InitiateCreateUserEvent(
                        displayNameValue: DisplayNameValue(displayNameController.text),
                      ),
                    );
                  }
                },
                child: const Text('Create Account'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}