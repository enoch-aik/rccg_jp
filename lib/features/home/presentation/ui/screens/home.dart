import 'package:rccg_jp/features/dashboard/presentation/ui/screens/dashboard.dart';
import 'package:rccg_jp/features/donations/presentation/ui/screens/donation.dart';
import 'package:rccg_jp/features/home/providers.dart';
import 'package:rccg_jp/lib.dart';
import 'package:rccg_jp/src/widgets/bottom_nav_icon.dart';

@RoutePage(name: 'home')
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedIndex = ref.watch(selectedHomeIndex);
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          items: bottomNavItems,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) {
            ref.read(selectedHomeIndex.notifier).state = index;
          },
        ),
        body: homeScreens[selectedIndex]);
  }
}

List<BottomNavigationBarItem> bottomNavItems = const [
  BottomNavigationBarItem(icon: Icon(BottomNavIcons.home), label: 'Dashboard'),
  BottomNavigationBarItem(
      icon: Icon(BottomNavIcons.donation), label: 'Donations'),
];

List<Widget> homeScreens = const [
  DashboardScreen(),
  DonationScreen(),
];
