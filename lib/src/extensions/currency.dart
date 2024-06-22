import 'package:rccg_jp/features/settings/data/models/currency.dart';

extension CurrencyExtension on List<Currency>{
  Currency getCurrency(String currencyShortName){
    return firstWhere((element) => element.shortName == currencyShortName);
  }
}