import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_flutter/constants/routes.dart';
import 'package:test_task_flutter/data/repositories/users_repository.dart';
import 'package:test_task_flutter/presentation/views/home.dart';
import 'package:test_task_flutter/presentation/views/user_details_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(RepositoryProvider(
    create: (context) => UsersRepository(),
    child: MaterialApp(
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
  ));
}
