import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rccg_jp/features/auth/presentation/ui/screens/login.dart';
import 'package:rccg_jp/features/onboarding/presentation/ui/screens/onboarding.dart';

part 'router.gr.dart';
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        //RedirectRoute(path: '', redirectTo: '/'),
        //AutoRoute(page: Login.page,initial:true),
        AutoRoute(path: '/', page: Onboarding.page, initial: true),
        AutoRoute(page: Login.page),

      ];

  Route<T> modalSheetBuilder<T>(
      BuildContext context, Widget child, AutoRoutePage<T> page,) {
    return ModalBottomSheetRoute(
        builder: (context) => child, isScrollControlled: false,);
  }
}
