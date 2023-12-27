import 'package:flutter/material.dart';
import 'package:test_task_flutter/core/app_router.dart';
import 'package:test_task_flutter/core/dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(
    MaterialApp.router(
      routerConfig: locator<AppRouter>().config(),
      title: 'Test task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    ),
  );
}
