import 'package:flutter/material.dart' show immutable;

@immutable
class SliderObject {
  final String title;
  final String subTitle;
  final String image;

  const SliderObject({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}
