import 'package:hive/hive.dart';
import 'package:test_task_flutter/data/models/user_model.dart';

Future<Box<UserModel>> initialiseHive() async {
  const usersKey = 'users';
  Hive.registerAdapter(UserModelAdapter());
  final usersBox = await Hive.openBox<UserModel>(usersKey);
  return usersBox;
}
