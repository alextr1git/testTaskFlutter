import 'package:flutter/material.dart';
import 'package:test_task_flutter/constants/routes.dart';
import 'package:test_task_flutter/views/home.dart';
import 'package:test_task_flutter/views/user_details_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Test task',
    initialRoute: homeRoute,
    routes: {
      homeRoute: (context) => const HomePage(),
      userDetailsRoute: (context) => const UserDetailsView(),
      },
          theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
      ));
}
