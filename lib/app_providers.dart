import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rccg_jp/src/res/theme/theme_provider.dart';

final colorSchemeProvider = StateProvider.family<ColorScheme, BuildContext>(
  (ref, context) => Theme.of(context).colorScheme,
);
/*final themeModeProvider = StateProvider.family<ThemeMode, BuildContext>(
    (ref, context) => Theme.of(context).brightness == Brightness.light
        ? ThemeMode.light
        : ThemeMode.dark);*/
final themeModeProvider =
    NotifierProvider<AppThemeMode, ThemeMode>(() => AppThemeMode());
