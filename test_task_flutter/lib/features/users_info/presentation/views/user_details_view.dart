import 'package:flutter/material.dart';
import 'package:test_task_flutter/features/users_info/domain/models/address_model.dart';
import 'package:test_task_flutter/features/users_info/domain/models/company_model.dart';
import 'package:test_task_flutter/features/users_info/domain/models/user_model.dart';
import 'package:test_task_flutter/features/users_info/presentation/widgets/details_holder.dart';
import 'package:test_task_flutter/features/users_info/utilities/get_arguments.dart';


class UserDetailsView extends StatefulWidget {
  const UserDetailsView({super.key});

  @override
  State<UserDetailsView> createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initUser();
  }

  String _name = "name is undefined";
  String _email = "email is undefined";
  String _phoneNumber = "phone is undefined";
  AddressModel? _address;
  CompanyModel? _company;

  void initUser() {
    final user = context.getArgument<UserModel>();
    if (user != null) {
      _name = user.name;
      _email = user.email;
      _phoneNumber = user.phone;
      _address = user.address;
      _company = user.company;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User details')),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: detailHolder(
            _name,
            _email,
            _address!,
            _company!,
            _phoneNumber,
          )),
    );
  }
}