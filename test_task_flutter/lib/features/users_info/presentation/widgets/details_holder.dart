import 'package:flutter/material.dart';
import 'package:test_task_flutter/features/users_info/domain/models/address_model.dart';
import 'package:test_task_flutter/features/users_info/domain/models/company_model.dart';

Widget detailHolder(
  String name,
  String email,
  AddressModel address,
  CompanyModel company,
  String phoneNumber,
) {
  return Column(
    children: [
      columnCell("Name", name),
      columnCell("Email", email),
      columnCell("Address",
          '${address.city}, ${address.street}, ${address.suite}, ${address.zipcode}'),
      columnCell("Phone", phoneNumber),
      columnCell("Company", company.name),
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
