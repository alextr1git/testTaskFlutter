
import 'package:test_task_flutter/features/users_info/domain/models/user_model.dart';

abstract class UsersRepository {
  getUsers();

  Future<void> saveUsers({
    required List<UserModel> userModels,
  });

  getAllCachedUsers();
}
