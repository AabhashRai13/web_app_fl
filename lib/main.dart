import 'package:find_scan_return_web/presentation/resources/router/routes.dart';
import 'package:flutter/material.dart';
import 'app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Find Scan Return',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: AppRouter.router,
    );
  }
}