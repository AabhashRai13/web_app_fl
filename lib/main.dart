import 'package:find_scan_return_web/presentation/resources/router/routes.dart';
import 'package:find_scan_return_web/presentation/resources/theme.dart';
import 'package:flutter/material.dart';
import 'app/di.dart';
import 'keys.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: firebaseConfigKeys["apiKey"]!,
    projectId: firebaseConfigKeys["projectId"]!,
    messagingSenderId: firebaseConfigKeys["messagingSenderId"]!,
    appId: firebaseConfigKeys["appId"]!,
  ));
  await initAppModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Find Scan Return',
      theme: theme(),
      routerConfig: AppRouter.router,
    );
  }
}