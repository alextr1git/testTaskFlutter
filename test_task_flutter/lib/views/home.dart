import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_task_flutter/constants/routes.dart';
import 'package:test_task_flutter/models/user_model.dart';
import 'package:test_task_flutter/service/api_service.dart';
import 'package:test_task_flutter/views/users_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Task"),
      ),
      body: _body(),
    );
  }

  FutureBuilder _body() {
    final apiService =
        ApiService(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder(
        future: apiService.getUsers(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final List<UserModel> users = snapshot.data!;
            return UsersListView(
                users: users,
                onTap: (user) {
                  Navigator.of(context)
                      .pushNamed(userDetailsRoute, arguments: user);
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }));
  }
}
