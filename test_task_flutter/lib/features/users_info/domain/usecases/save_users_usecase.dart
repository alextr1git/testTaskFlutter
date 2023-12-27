import 'package:test_task_flutter/features/users_info/domain/models/user_model.dart';
import 'package:test_task_flutter/features/users_info/domain/repositories/users_repository.dart';
import 'package:test_task_flutter/features/users_info/domain/usecases/usecase.dart';

class SaveUsersUsecase implements FutureUseCase<List<UserModel>, void> {
  final UsersRepository _repository;

  const SaveUsersUsecase({required UsersRepository repository})
      : _repository = repository;
  @override
  Future<void> execute(List<UserModel> modelsList) async {
    await _repository.saveUsers(userModelsList: modelsList);
  }
}
