import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rccg_jp/src/res/color_scheme/color_scheme.dart';

class ToronetTheme {
  const ToronetTheme._();

  // Made for FlexColorScheme version 7.0.5. Make sure you
// use same or higher package version, but still same major version.
// If you use a lower version, some properties may not be supported.
// In that case remove them after copying this theme to your app.
  static final ThemeData light = FlexThemeData.light(
    colorScheme: AppColorScheme.lightScheme,
    colors: const FlexSchemeColor(
      primary: Color(0xff00296b),
      primaryContainer: Color(0xffa0c2ed),
      secondary: Color(0xffd26900),
      secondaryContainer: Color(0xffffd270),
      tertiary: Color(0xff5c5c95),
      tertiaryContainer: Color(0xffc8dbf8),
      appBarColor: Color(0xffc8dcf8),
      error: null,
    ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 7,
    subThemesData: FlexSubThemesData(
      bottomSheetElevation: 0,
      bottomNavigationBarSelectedIconSize: 47.h,
      bottomNavigationBarUnselectedIconSize: 47.h,
      appBarCenterTitle: true,
      blendOnLevel: 10,
      blendOnColors: false,
      useM2StyleDividerInM3: true,
      textButtonRadius: 8.0,
      filledButtonRadius: 8.0,
      elevatedButtonRadius: 8.0,
      outlinedButtonRadius: 8.0,
      inputDecoratorRadius: 8.0,
      inputDecoratorUnfocusedBorderIsColored: false,
      inputDecoratorBorderWidth: 0.5,
      inputDecoratorFocusedBorderWidth: 2,
      cardRadius: 8.0,
      popupMenuRadius: 8.0,
      menuRadius: 8.0,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: 'EudoxusSans',
  );

  static final ThemeData dark = FlexThemeData.dark(
    colorScheme: AppColorScheme.darkScheme,
    colors: const FlexSchemeColor(
      primary: Color(0xffb1cff5),
      primaryContainer: Color(0xff3873ba),
      secondary: Color(0xffffd270),
      secondaryContainer: Color(0xffd26900),
      tertiary: Color(0xffc9cbfc),
      tertiaryContainer: Color(0xff535393),
      appBarColor: Color(0xff00102b),
      error: null,
    ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 13,
    subThemesData: FlexSubThemesData(
      bottomSheetElevation: 0,
      bottomNavigationBarSelectedIconSize: 47.h,
      bottomNavigationBarUnselectedIconSize: 47.h,
      appBarCenterTitle: true,
      blendOnLevel: 20,
      useM2StyleDividerInM3: true,
      textButtonRadius: 8.0,
      filledButtonRadius: 8.0,
      elevatedButtonRadius: 8.0,
      outlinedButtonRadius: 8.0,
      inputDecoratorRadius: 8.0,
      inputDecoratorUnfocusedBorderIsColored: false,
      inputDecoratorBorderWidth: 0.5,
      inputDecoratorFocusedBorderWidth: 2,
      cardRadius: 8.0,
      popupMenuRadius: 8.0,
      menuRadius: 8.0,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: 'EudoxusSans',
  );
}
