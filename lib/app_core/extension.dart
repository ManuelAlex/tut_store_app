const String emptyString = "";
const int zeroInt = 0;

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return emptyString;
    } else {
      return this!;
    }
  }
}

// extension on Integer

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return zeroInt;
    } else {
      return this!;
    }
  }
}
