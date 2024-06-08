import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';

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
}
