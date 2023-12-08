import 'package:flutter/material.dart';

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
