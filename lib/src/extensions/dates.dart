import 'package:intl/intl.dart';

extension DateConverter on DateTime {
  // Returns the time in a readable format
  String get toTime => DateFormat.Hm().format(this);

  // Returns the date in a readable format
  String toGroupName([bool weekday = true]) {
    final now = DateTime.now();

    if (toDateString() == now.toDateString()) {
      return 'Today';
    }

    if (toDateString() ==
        now.subtract(const Duration(days: 1)).toDateString()) {
      return 'Yesterday';
    }

    String format = '';
    if (weekday) {
      format += '${DateFormat.WEEKDAY}, ';
    }

    format += '${DateFormat.DAY} '
        '${DateFormat.ABBR_MONTH}, ${DateFormat.YEAR}';

    return DateFormat(format).format(this);
  }

  // Returns the date in a readable format
  String toDateString() {
    final format = DateFormat.yMd();
    return format.format(this).toLowerCase();
  }

  // Returns the date and time in a readable format
  String toDateAndTime() {
    final now = DateTime.now();
    final difference = differenceInDays(now, this);

    if (difference >= 7) {
      final formatter = DateFormat('MMMM d \'at\' h:mm a');
      return formatter.format(this);
    } else {
      final formatter = DateFormat('EEEE \'at\' h:mm a');
      return formatter.format(this);
    }
  }

  // Returns the difference in days between two dates
  int differenceInDays(DateTime a, DateTime b) {
    final difference = a.difference(b).inDays;
    return difference.abs();
  }

  // Returns the difference in hours and day between two dates
  String timeAgo() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inSeconds < 60) {
      return "${difference.inSeconds} secs ago";
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes} mins ago";
    } else if (difference.inHours < 48) {
      return "${difference.inHours} hrs ago";
    } else {
      final formatter = DateFormat.yMMMMd();
      return formatter.format(this);
    }
  }

  // check if two dates are the same day
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  // convert from date string in dd/MM/yyyy format to DateTime
  static DateTime fromString(String date) {
    final parts = date.split('/');
    return DateTime(int.parse(parts[2]), int.parse(parts[1]), int.parse(parts[0]));
  }

}
