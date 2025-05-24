class StringHelper {
  bool? stringContains(String? string, String part) {
    return string?.toLowerCase().contains(part.toLowerCase());
  }
}

extension StringHelperEx on String {
  String timeText({int defaultLength = 2}) {
    return padLeft(defaultLength, '0');
  }
}
