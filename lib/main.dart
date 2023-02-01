import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'config/di/di.dart';
import 'firebase_options.dart';
import 'mapper_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await configureDependencies();

  runApp(MapperApp.create());
}
