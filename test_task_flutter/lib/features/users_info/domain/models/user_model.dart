import 'package:test_task_flutter/features/users_info/domain/models/address_model.dart';
import 'package:test_task_flutter/features/users_info/domain/models/company_model.dart';

class UserModel {
  int id;
  String name;
  String email;
  AddressModel address;
  String phone;
  CompanyModel company;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.company,
  });
}
