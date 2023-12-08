import 'package:flutter/material.dart';
import 'package:test_task_flutter/data/models/user_model.dart';
import 'package:test_task_flutter/utilities/get_arguments.dart';

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
  Map<String, dynamic> _address = {};
  Map<String, String> _company = {};

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
            _address,
            _phoneNumber,
            _company,
          )),
    );
  }

  Widget detailHolder(
    String name,
    String email,
    Map<String, dynamic> address,
    String phoneNumber,
    Map<String, String> company,
  ) {
    return Column(
      children: [
        columnCell("Name", name),
        columnCell("Email", email),
        columnCell("Address",
            '${address["city"]}, ${address["street"]}, ${address["suite"]}, ${address["zipcode"]}'),
        columnCell("Phone", phoneNumber),
        columnCell("Company", company["name"]),
      ],
    );
  }

  Widget columnCell(title, value) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            Text(value),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
