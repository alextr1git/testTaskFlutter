import 'package:flutter/material.dart';
import 'package:test_task_flutter/core/dependencies.dart';
import 'package:test_task_flutter/features/users_info/presentation/constants/routes.dart';
import 'package:test_task_flutter/features/users_info/presentation/views/home.dart';
import 'package:test_task_flutter/features/users_info/presentation/views/user_details_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  runApp(
    MaterialApp(
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
    ),
  );
}

// Как уменьшить кол-во состояний в блоке?
