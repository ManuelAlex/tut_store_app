import 'package:flutter/material.dart' show immutable;

@immutable
class LoginRequest {
  final String email;
  final String password;
  final String imei;
  final String deviceType;
  const LoginRequest({
    required this.email,
    required this.password,
    required this.imei,
    required this.deviceType,
  });
}
