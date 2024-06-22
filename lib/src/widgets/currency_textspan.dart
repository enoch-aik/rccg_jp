import 'package:flutter/material.dart';
import 'package:rccg_jp/features/settings/data/models/currency.dart';

class KCurrencyTextSpan extends TextSpan {
  final Currency currency;

  KCurrencyTextSpan({
    required String text,
    required this.currency,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? lineHeight,
    TextAlign? textAlign,
    TextDecoration? decoration,
    TextOverflow? overflow,
    int? maxLines,
  }) : super(
          text: text,
          style: TextStyle(
            decoration: decoration,
            fontSize: fontSize ?? 18,
            fontWeight: fontWeight,
            color: color,
            height: lineHeight,
          ),
        );
}
