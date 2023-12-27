import 'package:hive/hive.dart';
import 'package:test_task_flutter/features/users_info/data/Entities/local/user_model_local.dart';
import 'package:test_task_flutter/features/users_info/data/providers/hive/hive_provider.dart';

class HiveProviderImpl implements HiveProvider {
  final Box<UserEntityLocal> _usersBox;

  HiveProviderImpl({required Box<UserEntityLocal> usersBox}) : _usersBox = usersBox;
  @override
  Future<void> cacheUsers({
    required List<UserEntityLocal> users,
  }) async {
    for (final user in users) {
      await _usersBox.put(
        user.id,
        user,
      );
    }
  }

  @override
  Future<List<UserEntityLocal>> fetchAllCachedUsers() async {
    final cachedUsers = _usersBox.values.toList();
    return cachedUsers;
  }
  
}
