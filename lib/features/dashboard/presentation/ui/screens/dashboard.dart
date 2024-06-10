import 'package:flutter/cupertino.dart';
import 'package:rccg_jp/features/dashboard/presentation/ui/widgets/bar_chart.dart';
import 'package:rccg_jp/features/dashboard/presentation/ui/widgets/doughnut_chart.dart';
import 'package:rccg_jp/features/dashboard/presentation/ui/widgets/ranged_donation.dart';
import 'package:rccg_jp/features/dashboard/providers.dart';
import 'package:rccg_jp/features/onboarding/providers.dart';
import 'package:rccg_jp/lib.dart';
import 'package:rccg_jp/src/extensions/extensions.dart';
import 'package:rccg_jp/src/extensions/new_donation.dart';

@RoutePage(name: 'dashboard')
class DashboardScreen extends HookConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);
    final donations = ref.watch(allDonationsStreamProvider);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  const KText(
                    'Hello  ',
                    fontSize: 16,
                  ),
                  KText(
                    '${currentUser!.displayName!.split(' ')[0]} 👋',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ],
              ),
              const ColSpacing(16),
              Align(
                alignment: Alignment.centerLeft,
                child: KText(
                  'Here are the estimated donations',
                  fontSize: 16,
                  color: context.primary,
                ),
              ),
              /* LinearProgressIndicator(
                value: 0.6,
                minHeight: 10,
                borderRadius: BorderRadius.circular(16),
              ),
              ColSpacing(16),*/
              Transform.scale(
                  scale: 1.3,
                  child: const SizedBox(height: 200, child: DoughnutChart())),

              donations.when(
                  data: (data) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RangedDonationWidget(
                                title: 'This week',
                                amount: data.totalAmountThisWeek
                                    .toFiatCurrencyFormat(decimalDigits: 0)),
                            RangedDonationWidget(
                                title: 'This month',
                                amount: data.totalAmountThisMonth
                                    .toFiatCurrencyFormat(decimalDigits: 0)),
                          ],
                        ),
                        const ColSpacing(24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RangedDonationWidget(
                                title: 'Past 3 months',
                                amount: data.totalAmountLast90Days
                                    .toFiatCurrencyFormat(decimalDigits: 0)),
                            RangedDonationWidget(
                                title: 'All time',
                                amount: data.totalAmountAllTime
                                    .toFiatCurrencyFormat(decimalDigits: 0))
                          ],
                        )
                      ],
                    );
                  },
                  error: (e, _) {
                    return const SizedBox();
                  },
                  loading: () => const SizedBox(
                      height: 200,
                      child: Center(child: CupertinoActivityIndicator()))),

              const ColSpacing(24),
//CandlestickChartWidget()
              const BarChartWidget()
            ],
          ),
        ),
      ),
    );
  }
}
