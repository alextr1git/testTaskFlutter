import 'package:hive_flutter/hive_flutter.dart';
part 'company_model_local.g.dart';
@HiveType(typeId: 2)
class CompanyEntityLocal {
  @HiveField(0)
  String name;
  @HiveField(1)
  String catchPhrase;
  @HiveField(2)
  String bs;

  CompanyEntityLocal({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });
}
