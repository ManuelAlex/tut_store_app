import 'package:flutter/material.dart' show immutable;

@immutable
class Contacts {
  final String email;
  final String phone;
  final String link;

  const Contacts({
    required this.email,
    required this.phone,
    required this.link,
  });
}
