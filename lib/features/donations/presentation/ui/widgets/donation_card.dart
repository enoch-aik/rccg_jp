import 'package:flutter_svg/svg.dart';
import 'package:rccg_jp/core/helpers/random_color_generator.dart';
import 'package:rccg_jp/features/donations/data/models/donor.dart';
import 'package:rccg_jp/features/settings/providers.dart';
import 'package:rccg_jp/lib.dart';
import 'package:rccg_jp/src/extensions/donor.dart';
import 'package:rccg_jp/src/extensions/extensions.dart';
import 'package:rccg_jp/src/extensions/new_donation.dart';
import 'package:rccg_jp/src/res/assets/svg/svg.dart';
import 'package:rccg_jp/src/widgets/init_icon.dart';

import 'status_card.dart';

class DonationCard extends HookConsumerWidget {
  final bool? expandedView;
  final Donor donor;
  final void Function()? onTap;

  const DonationCard(
      {super.key,
      this.expandedView = false,
      required this.onTap,
      required this.donor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCurrency = ref.watch(selectedCurrencyProvider);
    final allCurrencies = ref.watch(allCurrenciesProvider);
    return expandedView!
        ? Container(
            decoration: BoxDecoration(
                color: context.onPrimary,
                borderRadius: BorderRadius.circular(8.r)),
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    Initicon(
                      text: donor.name,
                      backgroundColor: context.onPrimaryContainer,
                    ),
                    const RowSpacing(12),
                    KText(
                      donor.name,
                    ),
                    const Spacer(),
                    CircularProgressIndicator(
                      value: 0.4,
                    //  semanticsValue: '%50',
                      backgroundColor: context.surfaceVariant,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  child: const Divider(
                    height: 0,
                  ),
                ),
                const StatusCard(status: PaymentStatus.completed),
                ColSpacing(8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    KText(
                      '4,000Kr/${donor.pledgedAmount.toFiatCurrencyFormat(decimalDigits: 0)}',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                ColSpacing(8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      schedule,
                      color: context.outline,
                    ),
                    RowSpacing(8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KText(
                          donor.installmentMonth > 1
                              ? '${donor.installmentMonth} months'
                              : '${donor.installmentMonth} month',
                          fontSize: 14.sp, fontWeight: FontWeight.bold,
                          //  color: context.outline,
                        ),
                        KText(
                          'Installments',
                          fontSize: 14.sp,
                          color: context.outline,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      /*width: 92.w,
                  height: 32.h,*/
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: context.primary),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.call_outlined,
                            color: context.onPrimary,
                          ),
                          RowSpacing(4.w),
                          KText(
                            'Contact',
                            fontSize: 13.sp,
                            color: context.onPrimary,
                            fontWeight: FontWeight.w500,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        : ListTile(
            onTap: onTap,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 6),
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Tooltip(
                  triggerMode: TooltipTriggerMode.tap,
                  message: switch (donor.getStatus()) {
                    PaymentStatus.notStarted => 'Not started',
                    PaymentStatus.inProgress => 'In progress',
                    PaymentStatus.completed => 'Completed',
                  },
                  child: Container(
                    height: double.maxFinite,
                    width: 4,
                    decoration: BoxDecoration(
                        color: switch (donor.getStatus()) {
                          PaymentStatus.notStarted => context.error,
                          PaymentStatus.inProgress => const Color(0xffEB833C),
                          PaymentStatus.completed => const Color(0xff7FC09C),
                        },
                        borderRadius: BorderRadius.circular(8.r)),
                  ),
                ),
                RowSpacing(6.w),
                Initicon(
                  text: donor.name,
                  backgroundColor: RandomColorGenerator.generateRandomColor,
                ),
              ],
            ),
            title: KText(
              donor.name,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
            subtitle: Text(
              '${donor.donations.totalAmount.toFiatCurrencyFormat(decimalDigits: 0)}/${ donor.pledgedAmount.toFiatCurrencyFormat(decimalDigits: 0)}',
              style: TextStyle(color: context.primary),
            ),
            trailing: CircularProgressIndicator(
              value: donor.getProgressValue(),
              //semanticsValue: '%50',
              backgroundColor: context.surfaceVariant,
            ),
          );
  }
}
