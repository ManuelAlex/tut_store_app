import 'dart:convert';

import 'package:flutter/material.dart' show immutable;

@immutable
class ContactsResponse {
  final String? email;

  final String? phone;

  final String? link;

  const ContactsResponse({
    this.email,
    this.phone,
    this.link,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (email != null) {
      result.addAll({'email': email});
    }
    if (phone != null) {
      result.addAll({'phone': phone});
    }
    if (link != null) {
      result.addAll({'link': link});
    }

    return result;
  }

  factory ContactsResponse.fromMap(Map<String, dynamic> map) {
    return ContactsResponse(
      email: map['email'],
      phone: map['phone'],
      link: map['link'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactsResponse.fromJson(String source) =>
      ContactsResponse.fromMap(json.decode(source));
}
