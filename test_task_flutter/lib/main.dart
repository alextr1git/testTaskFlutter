import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_task_flutter/constants/routes.dart';
import 'package:test_task_flutter/data/data_providers/service/hive_initialiser.dart';
import 'package:test_task_flutter/data/repositories/users_repository.dart';
import 'package:test_task_flutter/presentation/views/home.dart';
import 'package:test_task_flutter/presentation/views/user_details_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final usersBox = await initialiseHive();

  runApp(RepositoryProvider(
    create: (context) => UsersRepository(usersBox: usersBox),
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
