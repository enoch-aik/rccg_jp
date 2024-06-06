import 'package:flutter_svg/flutter_svg.dart';
import 'package:rccg_jp/features/donations/presentation/ui/widgets/donation_card.dart';
import 'package:rccg_jp/lib.dart';
import 'package:rccg_jp/src/res/assets/svg/svg.dart';
import 'package:rccg_jp/src/widgets/margin.dart';

@RoutePage(name: 'donation')
class DonationScreen extends HookConsumerWidget {
  const DonationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppNavigator.of(context).push(AddDonor());
        },
        tooltip: 'Add new donor',
        child: SvgPicture.asset(addDonationOutlined),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          itemBuilder: (context, index) {
            return DonationCard(
              key: ValueKey(index),
            );
          },
          separatorBuilder: (context, index) {
            return ColSpacing(16.h);
          },
          itemCount: 5,
        ),
      ),
    );
  }
}
