import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_task_flutter/features/users_info/domain/models/user_model.dart';
import 'package:test_task_flutter/features/users_info/presentation/widgets/details_holder.dart';
@RoutePage()
class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User details')),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: detailHolder(
            user.name,
            user.email,
            user.address,
            user.company,
            user.phone,
          )),
    );
  }
}
