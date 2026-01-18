
class LazyMethods {
  static String getFormattedDate(DateTime value) {
    return '${value.day}/${value.month}/${value.year}';
  }

  static String getDateTimeWithCount({required int dayCount}) {
    final dateTime = DateTime.now().subtract(Duration(days: dayCount));
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  static String getNameInitial(String? name) {
    if (name == null || name.trim().isEmpty) {
      return 'NA';
    }

    final parts = name.trim().split(RegExp(r'\s+'));

    if (parts.length == 1) {
      return parts[0][0].toUpperCase();
    } else {
      final first = parts.first[0].toUpperCase();
      final last = parts.last[0].toUpperCase();
      return '$first$last';
    }
  }

  static String formatDate(DateTime date) {
    final DateTime now = DateTime.now();

    // Remove time part for accurate comparison
    final DateTime today = DateTime(now.year, now.month, now.day);
    final DateTime yesterday = today.subtract(const Duration(days: 1));
    final DateTime givenDate = DateTime(date.year, date.month, date.day);

    if (givenDate == today) {
      return 'today';
    } else if (givenDate == yesterday) {
      return 'yesterday';
    } else {
      return "${date.day.toString().padLeft(2, '0')}/"
          "${date.month.toString().padLeft(2, '0')}/"
          '${date.year}';
    }
  }

  static List<String> nameMerge(List<String> list, int i) {
    final List<String> names = [];
    for (var j = 0; j < list.length; j += i) {
      names.add(list.sublist(j, j + i > list.length ? list.length : j + i).join(' '));
    }
    return names;
  }
}
