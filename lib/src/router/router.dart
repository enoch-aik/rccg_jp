import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rccg_jp/features/auth/presentation/ui/screens/login.dart';
import 'package:rccg_jp/features/dashboard/presentation/ui/screens/dashboard.dart';
import 'package:rccg_jp/features/donations/data/models/donor.dart';
import 'package:rccg_jp/features/donations/presentation/ui/screens/add_donation.dart';
import 'package:rccg_jp/features/donations/presentation/ui/screens/donation.dart';
import 'package:rccg_jp/features/donations/presentation/ui/screens/donor_details.dart';
import 'package:rccg_jp/features/donations/presentation/ui/screens/record_donation.dart';
import 'package:rccg_jp/features/home/presentation/ui/screens/home.dart';
import 'package:rccg_jp/features/onboarding/presentation/ui/screens/onboarding.dart';
import 'package:rccg_jp/features/settings/presentation/ui/modal/add_new_user.dart';
import 'package:rccg_jp/features/settings/presentation/ui/screens/control_user.dart';
import 'package:rccg_jp/features/settings/presentation/ui/screens/preferences.dart';
import 'package:rccg_jp/features/settings/presentation/ui/screens/settings.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        //RedirectRoute(path: '', redirectTo: '/'),
        //AutoRoute(page: Login.page,initial:true),
        AutoRoute(path: '/', page: Onboarding.page, initial: true),
        AutoRoute(page: Login.page),
        AutoRoute(page: Home.page),
        AutoRoute(page: Dashboard.page),
        AutoRoute(page: Donation.page),
        AutoRoute(page: AddDonor.page),
        AutoRoute(page: DonorDetails.page),
        AutoRoute(page: Settings.page),
        AutoRoute(page: ControlUser.page),
        AutoRoute(page: AddNewUserModal.page),
        AutoRoute(page: Preferences.page),
        //AutoRoute(page: RecordDonation.page),
      ];

  Route<T> modalSheetBuilder<T>(
    BuildContext context,
    Widget child,
    AutoRoutePage<T> page,
  ) {
    return ModalBottomSheetRoute(
      builder: (context) => child,
      isScrollControlled: false,
    );
  }
}
