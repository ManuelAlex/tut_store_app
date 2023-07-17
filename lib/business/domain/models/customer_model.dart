import 'package:flutter/material.dart' show immutable;

@immutable
class Customer {
  final String id;
  final String message;
  final int noOfNotification;
  const Customer({
    required this.id,
    required this.message,
    required this.noOfNotification,
  });
}
