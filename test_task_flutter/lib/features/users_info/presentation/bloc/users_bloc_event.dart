part of 'users_bloc_bloc.dart';

@immutable
sealed class UsersBlocEvent {}

class FetchUsers extends UsersBlocEvent {}

class UserSelected extends UsersBlocEvent {
  final UserModel user;

  UserSelected({required this.user});
}
