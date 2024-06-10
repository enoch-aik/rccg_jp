import 'package:rccg_jp/features/donations/data/models/donation_amount.dart';

extension NewDonationExtension on List<NewDonation> {
  // Returns the total amount of all donations
  double get totalAmount =>
      fold(0, (previousValue, element) => previousValue + element.amount);

  //get the total amount of donations done in the current week
  double get totalAmountThisWeek {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 7));
    return where((donation) =>
            donation.donatedAt.isAfter(startOfWeek) &&
            donation.donatedAt.isBefore(endOfWeek))
        .fold(0, (previousValue, element) => previousValue + element.amount);
  }

  //get the total amount of donations in the current month
  double get totalAmountThisMonth {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    final endOfMonth = DateTime(now.year, now.month + 1, 0);
    return where((donation) =>
            donation.donatedAt.isAfter(startOfMonth) &&
            donation.donatedAt.isBefore(endOfMonth))
        .fold(0, (previousValue, element) => previousValue + element.amount);
  }

  //get the total amount of donations in the last 7 days
  double get totalAmountLast7Days {
    final now = DateTime.now();
    final startOfLast7Days = now.subtract(const Duration(days: 7));
    return where((donation) =>
            donation.donatedAt.isAfter(startOfLast7Days) &&
            donation.donatedAt.isBefore(now))
        .fold(0, (previousValue, element) => previousValue + element.amount);
  }

  //get the total amount of donations in the last 30 days
  double get totalAmountLast30Days {
    final now = DateTime.now();
    final startOfLast30Days = now.subtract(const Duration(days: 30));
    return where((donation) =>
            donation.donatedAt.isAfter(startOfLast30Days) &&
            donation.donatedAt.isBefore(now))
        .fold(0, (previousValue, element) => previousValue + element.amount);
  }

  //get the total amount of donations in the last 90 days
  double get totalAmountLast90Days {
    final now = DateTime.now();
    final startOfLast90Days = now.subtract(const Duration(days: 90));
    return where((donation) =>
            donation.donatedAt.isAfter(startOfLast90Days) &&
            donation.donatedAt.isBefore(now))
        .fold(0, (previousValue, element) => previousValue + element.amount);
  }

  //get the total amount of donations all time
  double get totalAmountAllTime =>
      fold(0, (previousValue, element) => previousValue + element.amount);
}
