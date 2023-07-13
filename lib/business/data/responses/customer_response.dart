import 'dart:convert';

import 'package:flutter/material.dart' show immutable;

@immutable
class CustomerResponse {
  final String? id;
  final String? message;
  final int? noOfNotification;
  const CustomerResponse({
    this.id,
    this.message,
    this.noOfNotification,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (message != null) {
      result.addAll({'message': message});
    }
    if (noOfNotification != null) {
      result.addAll({'noOfNotification': noOfNotification});
    }

    return result;
  }

  CustomerResponse.fromMap(Map<String, dynamic> map)
      : this(
          id: map['id'],
          message: map['message'],
          noOfNotification: map['noOfNotification'],
        );

  String toJson() => json.encode(toMap());

  factory CustomerResponse.fromJson(String source) =>
      CustomerResponse.fromMap(json.decode(source));
}
