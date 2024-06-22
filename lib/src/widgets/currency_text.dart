import 'package:flutter/material.dart';
import 'package:rccg_jp/features/settings/data/models/currency.dart';
import 'package:rccg_jp/src/res/styles/styles.dart';

class KCurrencyText extends StatelessWidget {
  final String text;
  final Currency currency;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final double? lineHeight;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? addPlusSign;

  const KCurrencyText(this.text,
      {super.key,
      required this.currency,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.lineHeight,
      this.textAlign,
      this.decoration,
      this.overflow,
      this.maxLines,
      this.addPlusSign = false});

  @override
  Widget build(BuildContext context) {
    bool isSEK = currency.shortName == 'SEK';
    return Text(
      isSEK
          ? ('${addPlusSign! ? "+" : ""}$text ${currency.symbol}')
          : ('${addPlusSign! ? "+" : ""}${currency.symbol} $text'),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: AppStyles.textStyle.copyWith(
          decoration: decoration,
          fontSize: fontSize ?? 18,
          fontWeight: fontWeight /*?? FontWeight.w300*/,
          color: color,
          height: lineHeight,
          fontFamily: 'EudoxusSans'),
    );
  }
}
