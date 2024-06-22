import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rccg_jp/features/settings/data/models/currency.dart';

extension PriceConverter on double {
  String get toEightDP => toStringAsFixed(8);

  double get toTwoDP => double.parse(toStringAsFixed(2));

  String get toEighteenDP => toStringAsFixed(18);

  double exchangeRateWithRate(double rate) => rate.divide(this);

  //for dashboard balance conversion
  double get truncateWalletBalance =>
      (multiply(100)).truncateToDouble().divide(100);

  String toFiatCurrencyFormat({int decimalDigits = 2, bool group = false}) {
    NumberFormat formatter = NumberFormat.decimalPatternDigits(
      locale: 'en_us',
      decimalDigits: group ? getDecimalPlaces() : decimalDigits,
    );
    return formatter.format(this);
  }

  String toGroupedFormat({int? decimalDigits}) {
    NumberFormat formatter = NumberFormat.decimalPatternDigits(
      locale: 'en_us',
      decimalDigits: decimalDigits,
    );
    return formatter.format(this);
  }

  ///Due to loss of precision when performing BODMAS functions on flutter, these custom functions were created
  double multiply(double other) {
    return (Decimal.parse(toString()) * Decimal.parse(other.toString()))
        .toDouble();
  }

  double add(double other) {
    return (Decimal.parse(toString()) + Decimal.parse(other.toString()))
        .toDouble();
  }

  double subtract(double other) {
    return (Decimal.parse(toString()) - Decimal.parse(other.toString()))
        .toDouble();
  }

  double divide(double other) {
    return (Decimal.parse(toString()) / Decimal.parse(other.toString()))
        .toDouble();
  }

  int getDecimalPlaces() {
    // Convert the number to a string
    String numStr = toString();

    // Check if the number contains a decimal point
    if (numStr.contains('.')) {
      // Split the string by the decimal point
      List<String> parts = numStr.split('.');

      // If there are two parts (before and after the decimal point), count the decimal places
      if (parts.length == 2) {
        return parts[1].length;
      }
    }

    // If there's no decimal point or the number is an integer, return 0
    return 2;
  }

  //give numbers short form, like 33000 to 33k
  String get toShortForm {
    if (this >= 1000000000) {
      return '${(this / 1000000000).toStringAsFixed(1)}B';
    } else if (this >= 1000000) {
      return '${(this / 1000000).toStringAsFixed(1)}M';
    } else if (this >= 1000) {
      return '${(this / 1000).toStringAsFixed(1)}K';
    } else {
      return toString();
    }
  }

  //return color depending on the range of the total amount of donation, for less than 50% it returns red, for less than 75% it returns yellow, for less than 100% it returns green
  Color get donationColor {
    if (this < 1500000) {
      return const Color(0xffd26900);
    } else if (this < 2250000) {
      return const Color(0xff00296b);
    } else {
      return Colors.green;
    }
  }
}
