enum LanguageType { english, arabic }

const String arabic = "ar";
const String english = "en";

extension LanguageTypeExtension on LanguageType {
  String getLang() {
    switch (this) {
      case LanguageType.english:
        return english;
      case LanguageType.arabic:
        return arabic;
    }
  }
}
