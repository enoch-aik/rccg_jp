import 'package:flutter_animate/flutter_animate.dart';
import 'package:rccg_jp/features/donations/data/models/donor.dart';
import 'package:rccg_jp/features/donations/presentation/ui/widgets/donor_info_tile.dart';
import 'package:rccg_jp/features/donations/providers.dart';
import 'package:rccg_jp/lib.dart';
import 'package:rccg_jp/src/extensions/extensions.dart';

class ConfirmNewDonor extends HookConsumerWidget {
  final Donor donor;

  const ConfirmNewDonor({super.key, required this.donor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(children: [
        KText(
          'Please confirm the details below to add a new donor',
          fontSize: 16.sp,
          color: context.primary,
        ).animate().shimmer(duration: const Duration(seconds: 3)),
        ColSpacing(32.h),
        DonorInfoTile(title: 'Full name', value: donor.name),
        DonorInfoTile(title: 'Email', value: donor.email),
        DonorInfoTile(title: 'Phone number', value: donor.phoneNumber),
        DonorInfoTile(
            title: 'Amount',
            value: '${donor.currencyShortName}${donor.amount}'),
        DonorInfoTile(
            title: 'Installment', value: donor.installmentMonth.getName),
        DonorInfoTile(
            title: 'Pledge date', value: donor.pledgedAt.toDateAndTime()),
        ColSpacing(32.h),
        SizedBox(
          width: double.maxFinite,
          child: FilledButton(
            onPressed: () async {
              Loader.show(context);

              final donationRepo = ref.read(donationRepoProvider);

              final result = await donationRepo.addDonor(donor);
              if (context.mounted) {
                Loader.hide(context);
              }
              result.when(
                success: (data) {
                  context.router.popUntilRoot();
                  Toast.success(
                    'Donor added successfully',
                    context,
                  );
                },
                apiFailure: (e, _) {
                  AppNavigator.of(context).pop();
                  Toast.error(
                    'An error occurred while trying to add this donor, try again',
                    context,
                  );
                },
              );
            },
            child: const Text('Continue'),
          ),
        ),
      ]),
    );
  }

  static void displayModal(
    BuildContext context, {
    required Donor donor,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      constraints: BoxConstraints.tightFor(
        height: 400.h,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
      ),
      builder: (context) => ConfirmNewDonor(
        donor: donor,
      ),
    );
  }
}
