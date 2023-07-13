import 'package:flutter/material.dart' show immutable;

@immutable
class Failure {
  final int code;
  final String message;
  const Failure({
    required this.code,
    required this.message,
  });
}
