import 'package:hive_flutter/hive_flutter.dart';

import 'package:test_task_flutter/features/users_info/data/Entities/local/geo_model_local.dart';

part 'address_model_local.g.dart';
@HiveType(typeId: 1)
class AddressEntityLocal {
  @HiveField(0)
  String street;
  @HiveField(1)
  String suite;
  @HiveField(2)
  String city;
  @HiveField(3)
  String zipcode;
  @HiveField(5)
  GeoEntityLocal geo;
  AddressEntityLocal({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });
}
