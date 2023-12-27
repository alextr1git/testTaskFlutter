import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:test_task_flutter/features/users_info/domain/models/user_model.dart';
import 'package:test_task_flutter/features/users_info/domain/usecases/get_cached_users_usecase.dart';
import 'package:test_task_flutter/features/users_info/domain/usecases/get_users_usecase.dart';
import 'package:test_task_flutter/features/users_info/domain/usecases/save_users_usecase.dart';
import 'package:test_task_flutter/features/users_info/domain/usecases/usecase.dart';

part 'users_bloc_event.dart';
part 'users_bloc_state.dart';

class UsersBlocBloc extends Bloc<UsersBlocEvent, UsersBlocState> {
  final SaveUsersUsecase _saveUsersUsecase;
  final GetUsersUseCase _getUsersUsecase;
  final GetCacheUsersUseCase _getCachedUsersUsecase;

  UsersBlocBloc({
    required SaveUsersUsecase saveUsersUsecase,
    required GetUsersUseCase getUsersUsecase,
    required GetCacheUsersUseCase getCachedUsersUsecase,
  })  : _saveUsersUsecase = saveUsersUsecase,
        _getUsersUsecase = getUsersUsecase,
        _getCachedUsersUsecase = getCachedUsersUsecase,
        super(
          UsersBlocInitial(),
        ) {
    on<FetchUsers>((event, emit) async {
      emit(UsersBlocLoading());
      try {
        var connectivityResult = await Connectivity().checkConnectivity();
        if (connectivityResult == ConnectivityResult.wifi ||
            connectivityResult == ConnectivityResult.mobile) {
          final serverResponse = await _getUsersUsecase.execute(NoParams());
          await _saveUsersUsecase.execute(serverResponse);
          emit(UsersBlocLoaded(serverResponse));
        }
      } on DioException catch (_) {
        final cachedUsers = await _getCachedUsersUsecase.execute(NoParams());
        emit(UsersBlocOffline(cachedUsers));
      } catch (e) {
        emit(UsersBlocFailure(e.toString()));
      }
    });
  }
}
