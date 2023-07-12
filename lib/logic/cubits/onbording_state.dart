import 'package:flutter/foundation.dart';

import 'package:tut_store_app/business/domain/models/slider_model.dart';

class SliderState {
  final List<SliderObject> sliderObject;
  final int numOfSlides;
  int currentIndex;

  SliderState({
    required this.sliderObject,
    required this.numOfSlides,
    required this.currentIndex,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SliderState &&
        listEquals(other.sliderObject, sliderObject) &&
        other.numOfSlides == numOfSlides &&
        other.currentIndex == currentIndex;
  }

  @override
  int get hashCode =>
      sliderObject.hashCode ^ numOfSlides.hashCode ^ currentIndex.hashCode;
}
