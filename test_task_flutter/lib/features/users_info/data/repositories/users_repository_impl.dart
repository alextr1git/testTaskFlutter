import 'package:test_task_flutter/features/users_info/data/Entities/api/user_entity_api.dart';
import 'package:test_task_flutter/features/users_info/data/Entities/local/user_model_local.dart';
import 'package:test_task_flutter/features/users_info/data/mapper.dart';
import 'package:test_task_flutter/features/users_info/data/providers/api/api_service.dart';
import 'package:test_task_flutter/features/users_info/data/providers/hive/hive_provider.dart';
import 'package:test_task_flutter/features/users_info/domain/models/user_model.dart';
import 'package:test_task_flutter/features/users_info/domain/repositories/users_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  final ApiService _apiProvider;
  final HiveProvider _hiveProvider;

  UsersRepositoryImpl({
    required HiveProvider hiveProvider,
    required ApiService apiProvider,
  })  : _hiveProvider = hiveProvider,
        _apiProvider = apiProvider;

//-----------API-------------
  Future<List<UserModel>> getUsers() async {
    List<UserEntityApi> userEntitiesList = await _apiProvider.getUsers();
    List<UserModel> userModelsList =
        userEntitiesList.map((e) => UserMapper.toModel(e)).toList();
    return userModelsList;
  }

//-----------Local-------------
  Future<List<UserModel>> getAllCachedUsers() async {
    List<UserEntityLocal> userEntitiesList =
        await _hiveProvider.fetchAllCachedUsers();
    List<UserModel> userModelsList =
        userEntitiesList.map((e) => UserMapper.toModel(e)).toList();
    return userModelsList;
  }

  Future<void> saveUsers({
    required List<UserModel> userModelsList,
  }) async {
    List<UserEntityLocal> userEntitiesList =
        userModelsList.map((e) => UserMapper.toEntity(e)).toList();
    _hiveProvider.cacheUsers(userEntitiesList: userEntitiesList);
  }
}
