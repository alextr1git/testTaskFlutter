import 'package:test_task_flutter/features/users_info/data/Entities/local/user_model_local.dart';

abstract class HiveProvider {
  Future<void> cacheUsers({required List<UserEntityLocal> userEntitiesList});

  Future<List<UserEntityLocal>> fetchAllCachedUsers();
}
