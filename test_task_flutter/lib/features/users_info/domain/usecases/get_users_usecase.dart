import 'package:test_task_flutter/features/users_info/domain/models/user_model.dart';
import 'package:test_task_flutter/features/users_info/data/repositories/users_repository_impl.dart';
import 'package:test_task_flutter/features/users_info/domain/usecases/usecase.dart';

class GetUsersUseCase implements FutureUseCase<NoParams, List<UserModel>> {
  final UsersRepositoryImpl _repository;

  const GetUsersUseCase({required UsersRepositoryImpl repository})
      : _repository = repository;
  @override
  Future<List<UserModel>> execute(NoParams) async {
    final result = await _repository.getUsers();
    return result;
  }
}
