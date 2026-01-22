import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await configureDependencies();

  runApp(const TaskManagerApplication());
}

class TaskManagerApplication extends StatelessWidget {
  const TaskManagerApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

