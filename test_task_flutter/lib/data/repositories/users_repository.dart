import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:test_task_flutter/data/data_providers/service/api_service.dart';
import 'package:test_task_flutter/data/models/user_model.dart';

class UsersRepository {
  UsersRepository({
    required Box<UserModel> usersBox,
  }) : _usersBox = usersBox;

  final _apiService =
      ApiService(Dio(BaseOptions(contentType: "application/json")));
  final _usersBox;

  Future<List<UserModel>> getUsers() async {
    final List<UserModel> users = await _apiService.getUsers();
    return users;
  }

  Future<void> cacheUsers({required List<UserModel> users,}) async {
    for (final user in users) {
      await _usersBox.put(
        user.id,
        user,
      );
    }
  }

  Future<List<UserModel>> fetchAllCachedUsers() async {
    final cachedUsers = _usersBox.values.toList();
    return cachedUsers;
  }
}
