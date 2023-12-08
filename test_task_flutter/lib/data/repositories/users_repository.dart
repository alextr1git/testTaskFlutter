import 'package:dio/dio.dart';
import 'package:test_task_flutter/data/data_providers/service/api_service.dart';
import 'package:test_task_flutter/data/models/user_model.dart';

class UsersRepository {
  final _apiService =
      ApiService(Dio(BaseOptions(contentType: "application/json")));

  Future<List<UserModel>> getUsers() async {
    final List<UserModel> users = await _apiService.getUsers();
    return users;
  }
}
