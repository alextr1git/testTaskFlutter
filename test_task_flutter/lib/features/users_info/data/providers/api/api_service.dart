import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:test_task_flutter/features/users_info/data/Entities/api/user_entity_api.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('users')
  Future<List<UserEntityApi>> getUsers();
}
