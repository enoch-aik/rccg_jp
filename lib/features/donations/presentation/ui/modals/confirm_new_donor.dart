import 'package:flutter_animate/flutter_animate.dart';
import 'package:rccg_jp/features/donations/data/models/donor.dart';
import 'package:rccg_jp/lib.dart';
import 'package:rccg_jp/src/extensions/context.dart';

class ConfirmNewDonor extends StatelessWidget {
  final Donor donor;

  const ConfirmNewDonor({super.key, required this.donor});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(children: [
KText(
          'Please confirm the details below to add a new donor',
          fontSize: 16.sp,
          color: context.primary,
        ).animate().shimmer(duration: const Duration(seconds: 3)),
        ColSpacing(32.h),
        KText(
          'Full name: ${donor.name}',
          fontSize: 16.sp,
        ),
        KText(
          'Email: ${donor.email}',
          fontSize: 16.sp,
        ),
        KText(
          'Phone number: ${donor.phoneNumber}',
          fontSize: 16.sp,
        ),
        KText(
          'Amount: ${donor.amount}',
          fontSize: 16.sp,
        ),
        KText(
          'Installment month: ${donor.installmentMonth.name}',
          fontSize: 16.sp,
        ),
        KText(
          'Pledged at: ${donor.pledgedAt}',
          fontSize: 16.sp,
        ),
        KText(
          'Updated at: ${donor.updatedAt}',
          fontSize: 16.sp,
        ),
        KText(
          'Last donation at: ${donor.lastDonationAt}',
          fontSize: 16.sp,
        ),
        ColSpacing(32.h),
        SizedBox(
          width: double.maxFinite,
          child: FilledButton(
            onPressed: () {
              AppNavigator.of(context).pop();
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
        height: 480.h,
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
