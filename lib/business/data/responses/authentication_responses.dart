import 'dart:convert';
import 'base_response.dart';
import 'contacts_responce.dart';
import 'customer_response.dart';
import 'package:flutter/material.dart' show immutable;

@immutable
class AuthenticationResponse extends BaseResponse {
  final CustomerResponse? customer;

  final ContactsResponse? contacts;
  const AuthenticationResponse({
    this.contacts,
    this.customer,
  });

  @override
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (customer != null) {
      result.addAll({'customer': customer!.toMap()});
    }
    if (contacts != null) {
      result.addAll({'contacts': contacts!.toMap()});
    }

    return result;
  }

  factory AuthenticationResponse.fromMap(Map<String, dynamic> map) {
    return AuthenticationResponse(
      customer: map['customer'] != null
          ? CustomerResponse.fromMap(map['customer'])
          : null,
      contacts: map['contacts'] != null
          ? ContactsResponse.fromMap(map['contacts'])
          : null,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory AuthenticationResponse.fromJson(String source) =>
      AuthenticationResponse.fromMap(json.decode(source));
}
