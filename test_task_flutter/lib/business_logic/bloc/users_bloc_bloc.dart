import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:test_task_flutter/data/models/user_model.dart';
import 'package:test_task_flutter/data/repositories/users_repository.dart';

part 'users_bloc_event.dart';
part 'users_bloc_state.dart';

class UsersBlocBloc extends Bloc<UsersBlocEvent, UsersBlocState> {
  final UsersRepository _usersRepository;

  UsersBlocBloc(this._usersRepository) : super(UsersBlocInitial()) {
    on<FetchUsers>((event, emit) async {
      emit(UsersBlocLoading());
      try {
        var connectivityResult = await Connectivity().checkConnectivity();
        if (connectivityResult == ConnectivityResult.wifi ||
            connectivityResult == ConnectivityResult.mobile) {
          final serverResponse = await _usersRepository.getUsers();
          await _usersRepository.cacheUsers(users: serverResponse);
          final cachedUsers = await _usersRepository.fetchAllCachedUsers();
          emit(UsersBlocLoaded(cachedUsers));
        } else {
          final cachedUsers = await _usersRepository.fetchAllCachedUsers();
          emit(UsersBlocOffline(cachedUsers));
        }
      } on DioException catch (_) {
        final cachedUsers = await _usersRepository.fetchAllCachedUsers();
        emit(UsersBlocOffline(cachedUsers));
      } catch (e) {
        emit(UsersBlocFailure(e.toString()));
      }
    });
  }
}