extension IsNumeric on String {
  bool isNumeric() {
    final numericRegex = RegExp(r'^\d+$');
    return numericRegex.hasMatch(this);
  }
}

extension DateTimeExtensions on DateTime {
  String get toTimeWithAmPm {
    final hour = this.hour % 12 == 0 ? 12 : this.hour % 12;
    final minute = this.minute.toString().padLeft(2, '0');
    final period = this.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }
}

extension DateStringExtension on String {
  String get onlyDate {
    if (contains('T')) {
      return split('T').first;
    }
    return this;
  }
}
