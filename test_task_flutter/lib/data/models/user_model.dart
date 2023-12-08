import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  int id;
  String name;
  String email;
  Map <String, dynamic> address;
  String phone;
  Map <String, String>  company;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
