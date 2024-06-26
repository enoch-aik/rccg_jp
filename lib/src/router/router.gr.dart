// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddDonor.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddDonorScreen(),
      );
    },
    AddNewUserModal.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddNewUserModalScreen(),
      );
    },
    ControlUser.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ControlUserScreen(),
      );
    },
    Dashboard.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardScreen(),
      );
    },
    Donation.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DonationScreen(),
      );
    },
    DonorDetails.name: (routeData) {
      final args = routeData.argsAs<DonorDetailsArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DonorDetailsScreen(
          key: args.key,
          donor: args.donor,
        ),
      );
    },
    Home.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    Login.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    Onboarding.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    Settings.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
  };
}

/// generated route for
/// [AddDonorScreen]
class AddDonor extends PageRouteInfo<void> {
  const AddDonor({List<PageRouteInfo>? children})
      : super(
          AddDonor.name,
          initialChildren: children,
        );

  static const String name = 'AddDonor';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddNewUserModalScreen]
class AddNewUserModal extends PageRouteInfo<void> {
  const AddNewUserModal({List<PageRouteInfo>? children})
      : super(
          AddNewUserModal.name,
          initialChildren: children,
        );

  static const String name = 'AddNewUserModal';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ControlUserScreen]
class ControlUser extends PageRouteInfo<void> {
  const ControlUser({List<PageRouteInfo>? children})
      : super(
          ControlUser.name,
          initialChildren: children,
        );

  static const String name = 'ControlUser';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardScreen]
class Dashboard extends PageRouteInfo<void> {
  const Dashboard({List<PageRouteInfo>? children})
      : super(
          Dashboard.name,
          initialChildren: children,
        );

  static const String name = 'Dashboard';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DonationScreen]
class Donation extends PageRouteInfo<void> {
  const Donation({List<PageRouteInfo>? children})
      : super(
          Donation.name,
          initialChildren: children,
        );

  static const String name = 'Donation';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DonorDetailsScreen]
class DonorDetails extends PageRouteInfo<DonorDetailsArgs> {
  DonorDetails({
    Key? key,
    required Donor donor,
    List<PageRouteInfo>? children,
  }) : super(
          DonorDetails.name,
          args: DonorDetailsArgs(
            key: key,
            donor: donor,
          ),
          initialChildren: children,
        );

  static const String name = 'DonorDetails';

  static const PageInfo<DonorDetailsArgs> page =
      PageInfo<DonorDetailsArgs>(name);
}

class DonorDetailsArgs {
  const DonorDetailsArgs({
    this.key,
    required this.donor,
  });

  final Key? key;

  final Donor donor;

  @override
  String toString() {
    return 'DonorDetailsArgs{key: $key, donor: $donor}';
  }
}

/// generated route for
/// [HomeScreen]
class Home extends PageRouteInfo<void> {
  const Home({List<PageRouteInfo>? children})
      : super(
          Home.name,
          initialChildren: children,
        );

  static const String name = 'Home';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class Login extends PageRouteInfo<void> {
  const Login({List<PageRouteInfo>? children})
      : super(
          Login.name,
          initialChildren: children,
        );

  static const String name = 'Login';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class Onboarding extends PageRouteInfo<void> {
  const Onboarding({List<PageRouteInfo>? children})
      : super(
          Onboarding.name,
          initialChildren: children,
        );

  static const String name = 'Onboarding';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class Settings extends PageRouteInfo<void> {
  const Settings({List<PageRouteInfo>? children})
      : super(
          Settings.name,
          initialChildren: children,
        );

  static const String name = 'Settings';

  static const PageInfo<void> page = PageInfo<void>(name);
}
