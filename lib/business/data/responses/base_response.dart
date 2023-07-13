import 'dart:convert';

import 'package:flutter/material.dart' show immutable;

@immutable
class BaseResponse {
  final int? status;

  final String? message;
  const BaseResponse({this.status, this.message});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (status != null) {
      result.addAll({'status': status});
    }
    if (message != null) {
      result.addAll({'message': message});
    }

    return result;
  }

  factory BaseResponse.fromMap(Map<String, dynamic> map) {
    return BaseResponse(
      status: map['status']?.toInt(),
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BaseResponse.fromJson(String source) =>
      BaseResponse.fromMap(json.decode(source));
}
