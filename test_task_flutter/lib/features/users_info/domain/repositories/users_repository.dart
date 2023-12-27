
import 'package:test_task_flutter/features/users_info/domain/models/user_model.dart';

abstract class UsersRepository {
  Future<List<UserModel>>  getUsers();

  Future<void> saveUsers({
    required List<UserModel> userModelsList,
  });

    Future<List<UserModel>>  getAllCachedUsers();
}
