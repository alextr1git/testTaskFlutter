import 'package:test_task_flutter/features/users_info/data/Entities/local/address_model_local.dart';
import 'package:test_task_flutter/features/users_info/data/Entities/local/company_model_local.dart';
import 'package:test_task_flutter/features/users_info/data/Entities/local/geo_model_local.dart';
import 'package:test_task_flutter/features/users_info/data/Entities/local/user_model_local.dart';
import 'package:test_task_flutter/features/users_info/domain/models/address_model.dart';
import 'package:test_task_flutter/features/users_info/domain/models/company_model.dart';
import 'package:test_task_flutter/features/users_info/domain/models/geo_model.dart';
import 'package:test_task_flutter/features/users_info/domain/models/user_model.dart';

class UserMapper {
  static UserModel toModel(dynamic user) {
    return UserModel(
        id: user.id,
        name: user.name,
        phone: user.phone,
        email: user.email,
        address: AddressModel(
          city: user.address.city,
          geo: GeoModel(
            lat: user.address.geo.lat,
            lng: user.address.geo.lng,
          ),
          street: user.address.street,
          suite: user.address.suite,
          zipcode: user.address.zipcode,
        ),
        company: CompanyModel(
          bs: user.company.bs,
          catchPhrase: user.company.catchPhrase,
          name: user.company.name,
        ));
  }

  static UserEntityLocal toEntity(UserModel model) {
    return UserEntityLocal(
        id: model.id,
        name: model.name,
        email: model.email,
        address: AddressEntityLocal(
            street: model.address.street,
            suite: model.address.suite,
            city: model.address.city,
            zipcode: model.address.zipcode,
            geo: GeoEntityLocal(
              lat: model.address.geo.lat,
              lng: model.address.geo.lng,
            )),
        phone: model.phone,
        company: CompanyEntityLocal(
          name: model.company.name,
          catchPhrase: model.company.catchPhrase,
          bs: model.company.bs,
        ));
  }
}
