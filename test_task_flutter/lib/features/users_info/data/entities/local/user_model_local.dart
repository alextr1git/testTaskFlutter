import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_task_flutter/features/users_info/data/Entities/local/address_model_local.dart';
import 'package:test_task_flutter/features/users_info/data/Entities/local/company_model_local.dart';

part 'user_model_local.g.dart';

@HiveType(typeId: 4)
class UserEntityLocal {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String email;
  @HiveField(3)
  AddressEntityLocal address;
  @HiveField(4)
  String phone;
  @HiveField(5)
  CompanyEntityLocal company;

  UserEntityLocal({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.company,
  });

}
