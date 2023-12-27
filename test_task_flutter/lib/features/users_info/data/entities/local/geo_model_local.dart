import 'package:hive_flutter/hive_flutter.dart';
part 'geo_model_local.g.dart';

@HiveType(typeId: 3)
class GeoEntityLocal {
  @HiveField(0)
  String lat;
  @HiveField(1)
  String lng;

  GeoEntityLocal({
    required this.lat,
    required this.lng,
  });
}
