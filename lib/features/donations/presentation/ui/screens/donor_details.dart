import 'package:flutter_animate/flutter_animate.dart';
import 'package:rccg_jp/features/donations/presentation/ui/widgets/donor_info_tile.dart';
import 'package:rccg_jp/features/donations/presentation/ui/widgets/payment_tile.dart';
import 'package:rccg_jp/features/donations/presentation/ui/widgets/status_card.dart';
import 'package:rccg_jp/lib.dart';
import 'package:rccg_jp/src/extensions/extensions.dart';
import 'package:rccg_jp/src/widgets/init_icon.dart';

@RoutePage(name: 'donorDetails')
class DonorDetailsScreen extends StatelessWidget {
  const DonorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentStatus status = PaymentStatus.inProgress;
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.maxFinite,
          child: FilledButton(
            onPressed: () {},
            child: const Text('Record donation'),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.primaryContainer,
        foregroundColor: context.onPrimaryContainer,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              /*width: 92.w,
                    height: 32.h,*/
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: context.tertiary),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.call_outlined,
                    color: context.onPrimary,
                  ),
                  RowSpacing(4),
                  KText(
                    'Contact',
                    fontSize: 13.sp,
                    color: context.onPrimary,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        //  padding: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: context.primaryContainer,
                gradient: LinearGradient(
                  colors: [
                    context.primaryContainer,
                    context.primaryContainer.withOpacity(0)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: Initicon(
                text: 'Enoch Aik',
                size: 80,
                backgroundColor: context.primary,
                border: Border.all(width: 3, color: context.secondaryContainer),
              ),
            ),
            ColSpacing(24),
            const Align(
              alignment: Alignment.topCenter,
              child: KText(
                'Enoch Aik',
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            ColSpacing(24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  DonorInfoTile(
                    title: 'Phone',
                    value: '+46 76 123 4567',
                    addUnderline: true,
                  ),
                  DonorInfoTile(
                    title: 'Email',
                    value: 'enochaik@gmail.com',
                  ),
                  DonorInfoTile(
                    title: 'Last donation',
                    value: DateTime.now().toDateAndTime(),
                  ),
                ],
              ),
            ),
            ColSpacing(8),
            Divider(
              height: 0,
            ),
            ColSpacing(16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: context.secondaryContainer,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: context.shadow.withOpacity(0.11),
                      offset: const Offset(0, 4),
                      blurRadius: 8,
                    )
                  ],
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: KText(
                        'Donation status',
                        fontSize: 14,
                        color: context.outline,
                      ),
                    ),
                    const ColSpacing(16),
                    Container(
                      height: 80,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16)),
                      child: Row(
                        children: [
                          CircularProgressIndicatorWithText(
                            percentage: 10,
                          ).animate(onComplete: (_) {
                            _.repeat();
                          }).fade(duration: const Duration(seconds: 5)),
                          const RowSpacing(24),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const KText(
                                '4,000Kr/10,000Kr',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                              KText(
                                '10 months',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: context.outline,
                              ),
                            ],
                          ),
                          Spacer(),
                          Tooltip(
                            triggerMode: TooltipTriggerMode.tap,
                            message: switch (status) {
                              PaymentStatus.notStarted => 'Not started',
                              PaymentStatus.inProgress => 'In progress',
                              PaymentStatus.completed => 'Completed',
                            },
                            child: Container(
                              height: double.maxFinite,
                              width: 8,
                              decoration: BoxDecoration(
                                  color: switch (status) {
                                    PaymentStatus.notStarted => context.error,
                                    PaymentStatus.inProgress =>
                                      const Color(0xffEB833C),
                                    PaymentStatus.completed =>
                                      const Color(0xff7FC09C),
                                  },
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ColSpacing(24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const KText('Recent Donations', fontSize: 15),
                      InkWell(
                        onTap: () {},
                        child: KText(
                          'View all',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: context.primary,
                        ),
                      ),
                    ],
                  ),
                  ColSpacing(16),
                  Container(
                    width: double.maxFinite,
                    //padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        //color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        )),
                   // padding: EdgeInsets.only(top: 8,left: 8,right:8),
                    child: Column(
                      children: [
                        PaymentTile(),
                        PaymentTile(),
                        PaymentTile(),
                        PaymentTile(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircularProgressIndicatorWithText extends StatelessWidget {
  late String? text;
  final int percentage;

  CircularProgressIndicatorWithText(
      {super.key, this.text, required this.percentage});

  @override
  Widget build(BuildContext context) {
    var value = percentage / 100.0;
    var size = 80.0;

    text ??= '$percentage%';

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Center(
          child: SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator.adaptive(
              strokeWidth: 6,
              value: value,
              strokeCap: StrokeCap.round,
            ),
          ),
        ),
        Center(
            child: KText(
          text!,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: context.primary,
        )),
      ],
    );
  }
}
