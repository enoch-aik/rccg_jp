import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rccg_jp/features/donations/presentation/ui/widgets/donation_card.dart';
import 'package:rccg_jp/features/donations/providers.dart';
import 'package:rccg_jp/lib.dart';
import 'package:rccg_jp/src/res/assets/svg/svg.dart';

@RoutePage(name: 'donation')
class DonationScreen extends HookConsumerWidget {
  const DonationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final donations = ref.watch(allDonationsStreamProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppNavigator.of(context).push(AddDonor());
        },
        tooltip: 'Add new donor',
        child: SvgPicture.asset(addDonationOutlined),
      ),
      body: SafeArea(
          child: donations.when(data: (data) {
        if (data.isEmpty) {
          return const Center(child: Text('No donor has been added yet'));
        }

        return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          itemBuilder: (context, index) {
            return DonationCard(
              donor: data[index],
              key: ValueKey(index),
              // expandedView: true,
              onTap: () {
                AppNavigator.of(context).push(
                  DonorDetails(
                    donor: data[index],
                  ),
                );
              },
            );
          },
          separatorBuilder: (context, index) {
            return ColSpacing(16.h);
          },
          itemCount: data.length,
        );
      }, error: (e, _) {
        return Center(child: Text(e.toString()));
      }, loading: () {
        return const Center(child: CupertinoActivityIndicator());
      })),
    );
  }
}
