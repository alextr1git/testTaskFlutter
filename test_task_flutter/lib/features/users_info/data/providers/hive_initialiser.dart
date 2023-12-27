import 'package:hive/hive.dart';
import 'package:test_task_flutter/features/users_info/data/Entities/local/address_model_local.dart';
import 'package:test_task_flutter/features/users_info/data/Entities/local/company_model_local.dart';
import 'package:test_task_flutter/features/users_info/data/Entities/local/geo_model_local.dart';
import 'package:test_task_flutter/features/users_info/data/Entities/local/user_model_local.dart';



Future<Box<UserEntityLocal>> initialiseHive() async {
  const usersKey = 'user';
  const addressKey = 'address';
   const companyKey = 'company';
    const geoKey = 'geo';
  Hive.registerAdapter(UserEntityLocalAdapter());
  Hive.registerAdapter(AddressEntityLocalAdapter());
  Hive.registerAdapter(GeoEntityLocalAdapter());
  Hive.registerAdapter(CompanyEntityLocalAdapter());
  await Hive.openBox<GeoEntityLocal>(geoKey);
  await Hive.openBox<AddressEntityLocal>(addressKey);
  await Hive.openBox<CompanyEntityLocal>(companyKey);
  final usersBox = await Hive.openBox<UserEntityLocal>(usersKey);
  return usersBox;
}
