import 'package:flutter/material.dart';
import 'package:test_task_flutter/data/models/user_model.dart';

typedef UserCallback = void Function(UserModel user);

class UsersListView extends StatelessWidget {
  final List<UserModel> users;
  final UserCallback onTap;
  const UsersListView({super.key, required this.users, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Column(
          children: [
            ListTile(
              onTap: () {
                onTap(user);
              },
              title: Text(
                users[index].name,
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        );
      },
    );
  }
}
