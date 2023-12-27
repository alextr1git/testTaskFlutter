
import 'package:test_task_flutter/features/users_info/domain/models/user_model.dart';
import 'package:test_task_flutter/features/users_info/domain/repositories/users_repository.dart';
import 'package:test_task_flutter/features/users_info/domain/usecases/usecase.dart';

class GetCacheUsersUseCase implements FutureUseCase<NoParams, List<UserModel>> {
  final UsersRepository _repository;

  const GetCacheUsersUseCase({required UsersRepository repository})
      : _repository = repository;
  @override
  Future<List<UserModel>> execute(NoParams) async {
    final List<UserModel> result = await _repository.getAllCachedUsers();
    return result;
  }
}
