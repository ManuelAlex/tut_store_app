import 'package:flutter/material.dart' show immutable;

@immutable
class DeviceInfo {
  final String name;
  final String identifier;
  final String version;

  const DeviceInfo({
    required this.name,
    required this.identifier,
    required this.version,
  });
}
