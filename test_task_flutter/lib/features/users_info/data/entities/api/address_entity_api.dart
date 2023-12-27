import 'package:test_task_flutter/features/users_info/data/Entities/api/geo_entity_api.dart';

class AddressEntityApi {
  String street;
  String suite;
  String city;
  String zipcode;
  GeoEntityApi geo;
  AddressEntityApi({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory AddressEntityApi.fromJson(Map<String, dynamic> json) =>
      AddressEntityApi(
        street: json["street"] ?? "",
        suite: json["suite"] ?? "",
        city: json["city"] ?? "",
        zipcode: json["zipcode"] ?? "",
        geo: GeoEntityApi.fromJson(json["geo"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo,
      };
}
