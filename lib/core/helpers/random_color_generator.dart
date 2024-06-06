import 'dart:math';

import 'package:flutter/material.dart';

class RandomColorGenerator {
  static Color get generateRandomColor =>
      Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
}
