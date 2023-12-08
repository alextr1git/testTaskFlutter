import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_task_flutter/data/models/user_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('users')
  Future<List<UserModel>> getUsers();
}
