import 'package:flutter/material.dart' show immutable;

import 'contact_model.dart';
import 'customer_model.dart';

@immutable
class Authentication {
  final Customer customer;

  final Contacts contacts;
  const Authentication({
    required this.contacts,
    required this.customer,
  });
}
