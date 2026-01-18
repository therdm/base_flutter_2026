import 'package:domain/utils/country_code.dart';

class PhoneNumberUtils {
  PhoneNumberUtils._();

  static final instance = PhoneNumberUtils._();

  Future<String?> extractCountryCode(String phoneNumber) async {
    final result = await CountryCode.instance.extractCountryCode(phoneNumber);
    return result;
  }

  bool matchesPhoneNumberPattern(String input) {
    if (input.isEmpty) {
      return false;
    }
    final RegExp phoneRegExp = RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*[0-9]{5,}$');
    return phoneRegExp.hasMatch(input);
  }

  String normalizedPhoneNumber(String phoneNumber) {
    final reg = RegExp(r'[^a-zA-Z0-9+]');
    final cleanedPhoneNumber = phoneNumber.replaceAll(reg, '');
    return cleanedPhoneNumber;
    // return phoneNumber.replaceAll(' ', '').replaceAll('(', '').replaceAll(')', '');
  }
}
