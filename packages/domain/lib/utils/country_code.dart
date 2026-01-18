import 'package:flutter/foundation.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart' as phone_number;

class CountryCode {
  CountryCode._();
  static final instance = CountryCode._();

  Future<String?> extractCountryCode(String rawNumber) async {
    const countryCodeKeyName = 'country_code';
    if (rawNumber.isEmpty) {
      return null;
    }
    try {
      final phoneNumber = await phone_number.parse(rawNumber);
      if (phoneNumber[countryCodeKeyName] != null) {
        return phoneNumber[countryCodeKeyName].toString();
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Could not parse "$rawNumber" to extract country code: $e');
      }
      return null;
    }
  }
}
