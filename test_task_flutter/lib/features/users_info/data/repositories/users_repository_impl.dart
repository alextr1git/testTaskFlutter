import 'package:test_task_flutter/features/users_info/data/Entities/api/user_entity_api.dart';
import 'package:test_task_flutter/features/users_info/data/Entities/local/user_model_local.dart';
import 'package:test_task_flutter/features/users_info/data/mapper.dart';
import 'package:test_task_flutter/features/users_info/data/providers/api/api_service.dart';
import 'package:test_task_flutter/features/users_info/data/providers/hive/hive_provider_impl.dart';
import 'package:test_task_flutter/features/users_info/domain/models/user_model.dart';
import 'package:test_task_flutter/features/users_info/domain/repositories/users_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  final ApiService _apiProvider;
  final HiveProviderImpl _hiveProvider;

  UsersRepositoryImpl({
    required HiveProviderImpl hiveProvider,
    required ApiService apiProvider,
  })  : _hiveProvider = hiveProvider,
        _apiProvider = apiProvider;

//-----------API-------------
  Future<List<UserModel>> getUsers() async {
    List<UserEntityApi> entitiesList = await _apiProvider.getUsers();
    List<UserModel> modelsList = [];
    for (var entity in entitiesList) {
      modelsList.add(UserMapper.toModel(entity));
    }
    return modelsList;
  }

//-----------Local-------------
  Future<void> saveUsers({
    required List<UserModel> userModels,
  }) async {
    List<UserEntityLocal> entitiesList = [];
    for (var user in userModels) {
      entitiesList.add(UserMapper.toEntity(user));
    }
    _hiveProvider.cacheUsers(users: entitiesList);
  }

  Future<List<UserModel>> getAllCachedUsers() async {
    List<UserEntityLocal> entitiesList =
        await _hiveProvider.fetchAllCachedUsers();
    List<UserModel> modelsList = [];
    for (var entity in entitiesList) {
      modelsList.add(UserMapper.toModel(entity));
    }
    return modelsList;
  }
}
