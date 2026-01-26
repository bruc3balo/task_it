import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:auth_presentation/features/auth/auth_bloc.dart';
import 'package:taskmanager/routes/app_routes.dart';

import 'firebase_options.dart';
import 'di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await configureDependencies();

  runApp(const TaskManagerApplication());
}

class TaskManagerApplication extends StatefulWidget {
  const TaskManagerApplication({super.key});

  @override
  State<TaskManagerApplication> createState() => _TaskManagerApplicationState();
}

class _TaskManagerApplicationState extends State<TaskManagerApplication> {
  // 1. Initialize the AuthBloc and trigger the check immediately
  final _authBloc = GetIt.I<AuthBloc>()..add(CheckAuthStateEvent());

  // 2. Pass the initialized Bloc to the Router
  late final _appRouter = AppRouter(_authBloc);

  @override
  Widget build(BuildContext context) {
    // 3. Provide the Bloc to the widget tree (so child pages can access it)
    return BlocProvider.value(
      value: _authBloc,
      child: MaterialApp.router(
        title: 'Task Manager',
        routerConfig: _appRouter.router,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Optional: Close the bloc if this widget is ever disposed
    // (unlikely for the root widget, but good practice)
    _authBloc.close();
    super.dispose();
  }

}