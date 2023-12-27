import 'package:test_task_flutter/features/users_info/data/repositories/users_repository_impl.dart';
import 'package:test_task_flutter/features/users_info/domain/models/user_model.dart';
import 'package:test_task_flutter/features/users_info/domain/usecases/usecase.dart';

class SaveUsersUsecase implements FutureUseCase<List<UserModel>, void> {
  final UsersRepositoryImpl _repository;

  const SaveUsersUsecase({required UsersRepositoryImpl repository})
      : _repository = repository;
  @override
  Future<void> execute(List<UserModel> modelsList) async {
    await _repository.saveUsers(userModels: modelsList);
  }
}
