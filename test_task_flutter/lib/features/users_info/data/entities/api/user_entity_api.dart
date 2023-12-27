import 'package:test_task_flutter/features/users_info/data/Entities/api/address_entity_api.dart';
import 'package:test_task_flutter/features/users_info/data/Entities/api/company_entity_api.dart';

class UserEntityApi {
  int id;
  String name;
  String email;
  AddressEntityApi address;
  String phone;
  CompanyEntityApi company;

  UserEntityApi({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.company,
  });

  factory UserEntityApi.fromJson(Map<String, dynamic> json) => UserEntityApi(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        address: AddressEntityApi.fromJson(json["address"]),
        phone: json["phone"] ?? "",
        company: CompanyEntityApi.fromJson(json),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "address": address,
        "phone": phone,
        "company": company.toJson(),
      };
}
