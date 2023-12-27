import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_task_flutter/features/users_info/data/providers/api/api_service.dart';
import 'package:test_task_flutter/features/users_info/data/providers/hive/hive_provider_impl.dart';
import 'package:test_task_flutter/features/users_info/data/providers/hive_initialiser.dart';
import 'package:test_task_flutter/features/users_info/data/repositories/users_repository_impl.dart';
import 'package:test_task_flutter/features/users_info/domain/usecases/get_cached_users_usecase.dart';
import 'package:test_task_flutter/features/users_info/domain/usecases/get_users_usecase.dart';
import 'package:test_task_flutter/features/users_info/domain/usecases/save_users_usecase.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  await Hive.initFlutter();
  final usersBox = await initialiseHive();

  locator.registerSingleton<HiveProviderImpl>(
      HiveProviderImpl(usersBox: usersBox));

  locator.registerSingleton<ApiService>(
      ApiService(Dio(BaseOptions(contentType: "application/json"))));

  locator.registerSingleton<UsersRepositoryImpl>(UsersRepositoryImpl(
    hiveProvider: locator<HiveProviderImpl>(),
    apiProvider: locator<ApiService>(),
  ));

  locator.registerSingleton<GetUsersUseCase>(
      GetUsersUseCase(repository: locator<UsersRepositoryImpl>()));

  locator.registerSingleton<GetCacheUsersUseCase>(
      GetCacheUsersUseCase(repository: locator<UsersRepositoryImpl>()));

  locator.registerSingleton<SaveUsersUsecase>(
      SaveUsersUsecase(repository: locator<UsersRepositoryImpl>()));
}
