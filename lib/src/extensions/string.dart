import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';
import 'package:rccg_jp/src/extensions/double.dart';

extension CurrencyFormatter on String {
  String get firstLetterLowerCase =>
      isNotEmpty ? this[0].toLowerCase() + substring(1) : '';

  double get currencyToDouble => double.parse(replaceAll(',', ''));

  Decimal get currencyToDecimal => Decimal.parse(this);

  //for dashboard balance conversion
  double get truncateWalletBalance =>
      (currencyToDouble.multiply(100)).truncateToDouble().divide(100);

  String toFiatCurrencyFormat() {
    NumberFormat formatter = NumberFormat.decimalPatternDigits(
      locale: 'en_us',
      decimalDigits: 2,
    );
    return formatter.format(double.parse(replaceAll(',', '')));
  }

  //remove all , and . in the string
  String get removeCommaAndDot => replaceAll(',', '').replaceAll('.', '');

  //remove all , in the string
  String get removeComma => replaceAll(',', '');

  //remove all . in the string
  String get removeDot => replaceAll('.', '');

  ///To get the extension of an image

  bool isSvg() {
    if (!isEmpty) {
      return toLowerCase().endsWith('.svg');
    }
    return false;
  }

  bool isImg() {
    if (!isEmpty) {
      return toLowerCase().endsWith('.png') || toLowerCase().endsWith('.jpg');
    }
    return false;
  }

  // convert from date string in dd/MM/yyyy format to DateTime
  DateTime toDateTime() {
    final parts = split('/');
    return DateTime(
        int.parse(parts[2]), int.parse(parts[1]), int.parse(parts[0]));
  }
}
