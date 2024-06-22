import 'package:rccg_jp/features/donations/data/models/donation_amount.dart';
import 'package:rccg_jp/features/settings/data/models/currency.dart';
import 'package:rccg_jp/src/extensions/double.dart';

extension NewDonationExtension on NewDonation {
  //currency is the selectedCurrency according to the user's settings, this is stored in the provider
  double convertedDonationAmount(
      {required Currency selectedCurrency,
      required List<Currency> currencies}) {
    final donationCurrency = currencies
        .firstWhere((element) => element.shortName == currencyShortName);
    return selectedCurrency.rate.divide(donationCurrency.rate).multiply(amount);
  }

  double convertedDonationAmountWithShortName(
      {required Currency selectedCurrency,
      required List<Currency> currencies,
      required String currencyShortName}) {
    final donationCurrency = currencies
        .firstWhere((element) => element.shortName == currencyShortName);
    return selectedCurrency.rate.divide(donationCurrency.rate).multiply(amount);
  }
}

extension NewDonationListExtension on List<NewDonation> {
  // Returns the total amount of all donations
  double get totalAmount {
    if (isNotEmpty) {
      return fold(
          0, (previousValue, element) => previousValue + element.amount);
    }
    return 0;
  }

  double convertedTotalAmount(
      {required Currency selectedCurrency,
      required List<Currency> currencies}) {
    if (isNotEmpty) {
      return fold(
          0,
          (previousValue, element) =>
              previousValue +
              element.convertedDonationAmount(
                  selectedCurrency: selectedCurrency, currencies: currencies));
    }
    return 0;
  }

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

  double convertedTotalAmountThisWeek(
      {required Currency selectedCurrency,
      required List<Currency> currencies}) {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 7));
    return where((donation) =>
            donation.donatedAt.isAfter(startOfWeek) &&
            donation.donatedAt.isBefore(endOfWeek))
        .fold(
            0,
            (previousValue, element) =>
                previousValue +
                element.convertedDonationAmount(
                    selectedCurrency: selectedCurrency,
                    currencies: currencies));
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

  double convertedTotalAmountThisMonth(
      {required Currency selectedCurrency,
      required List<Currency> currencies}) {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    final endOfMonth = DateTime(now.year, now.month + 1, 0);
    return where((donation) =>
            donation.donatedAt.isAfter(startOfMonth) &&
            donation.donatedAt.isBefore(endOfMonth))
        .fold(
            0,
            (previousValue, element) =>
                previousValue +
                element.convertedDonationAmount(
                    selectedCurrency: selectedCurrency,
                    currencies: currencies));
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

  double convertedTotalAmountLast7Days(
      {required Currency selectedCurrency,
      required List<Currency> currencies}) {
    final now = DateTime.now();
    final startOfLast7Days = now.subtract(const Duration(days: 7));
    return where((donation) =>
            donation.donatedAt.isAfter(startOfLast7Days) &&
            donation.donatedAt.isBefore(now))
        .fold(
            0,
            (previousValue, element) =>
                previousValue +
                element.convertedDonationAmount(
                    selectedCurrency: selectedCurrency,
                    currencies: currencies));
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

  double convertedTotalAmountLast30Days(
      {required Currency selectedCurrency,
      required List<Currency> currencies}) {
    final now = DateTime.now();
    final startOfLast30Days = now.subtract(const Duration(days: 30));
    return where((donation) =>
            donation.donatedAt.isAfter(startOfLast30Days) &&
            donation.donatedAt.isBefore(now))
        .fold(
            0,
            (previousValue, element) =>
                previousValue +
                element.convertedDonationAmount(
                    selectedCurrency: selectedCurrency,
                    currencies: currencies));
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

  double convertedTotalAmountLast90Days(
      {required Currency selectedCurrency,
      required List<Currency> currencies}) {
    final now = DateTime.now();
    final startOfLast90Days = now.subtract(const Duration(days: 90));
    return where((donation) =>
            donation.donatedAt.isAfter(startOfLast90Days) &&
            donation.donatedAt.isBefore(now))
        .fold(
            0,
            (previousValue, element) =>
                previousValue +
                element.convertedDonationAmount(
                    selectedCurrency: selectedCurrency,
                    currencies: currencies));
  }

  //get the total amount of donations all time
  double get totalAmountAllTime =>
      fold(0, (previousValue, element) => previousValue + element.amount);

  double convertedTotalAmountAllTime(
          {required Currency selectedCurrency,
          required List<Currency> currencies}) =>
      fold(
          0,
          (previousValue, element) =>
              previousValue +
              element.convertedDonationAmount(
                  selectedCurrency: selectedCurrency, currencies: currencies));

  //get a List<List<Donation>> that is sorted according to the months of the donation
  List<List<NewDonation>> get donationsByMonth {
    final now = DateTime.now();
    final startOfThisYear = DateTime(now.year, 1, 1);
    final endOfThisYear = DateTime(now.year, 12, 31);
    final donationsByMonth = <List<NewDonation>>[];
    for (var i = 1; i <= 12; i++) {
      final startOfMonth = DateTime(now.year, i, 1);
      final endOfMonth = DateTime(now.year, i + 1, 0);
      final donationsInMonth = where((donation) =>
          donation.donatedAt.isAfter(startOfMonth) &&
          donation.donatedAt.isBefore(endOfMonth));
      donationsByMonth.add(donationsInMonth.toList());
    }
    return donationsByMonth;
  }

  //get a Map<DateTime,<List<Donation>> for the current and last 11 from from now that is sorted according to the months of the donation in descending order,(where the year is also changed for months in previous years) where the key is the DateTime for the month and months after the current month of the year not included, only previous months
  Map<DateTime, List<NewDonation>> donationsByMonthMap({int months = 10}) {
    final now = DateTime.now();
    final startOfThisYear = DateTime(now.year, 1, 1);
    final endOfThisYear = DateTime(now.year, 12, 31);
    final donationsByMonthMap = <DateTime, List<NewDonation>>{};
    for (var i = 0; i < months; i++) {
      final startOfMonth = DateTime(now.year, now.month - i, 1);
      final endOfMonth = DateTime(now.year, now.month - i + 1, 0);
      final donationsInMonth = where((donation) =>
          donation.donatedAt.isAfter(startOfMonth) &&
          donation.donatedAt.isBefore(endOfMonth));
      donationsByMonthMap[startOfMonth] = donationsInMonth.toList();
    }
    //return reversed map
    return Map.fromEntries(donationsByMonthMap.entries.toList().reversed);
  }

  //remove month where there are no donations
  List<List<NewDonation>> get donationsByMonthWithoutEmptyMonths {
    return donationsByMonth.where((donations) => donations.isNotEmpty).toList();
  }

  //use a switch case to get the month name of List<NewDonation> based on the first item in the list
  String getMonthName(List<NewDonation> donations) {
    final month = donations.first.donatedAt.month;
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }
}
