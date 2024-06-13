import 'package:flutter/cupertino.dart';
import 'package:rccg_jp/features/dashboard/presentation/ui/widgets/bar_chart.dart';
import 'package:rccg_jp/features/dashboard/presentation/ui/widgets/progress_bar.dart';
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
    final List<String> chartOptions = ['Last 6 months', 'Last 12 months'];
    final chosenOption = useState('Last 6 months');
    return Scaffold(
      extendBodyBehindAppBar: true,
      /*appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),*/
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              /* Row(
                children: [
                  const KText(
                    'Hello ',
                    fontSize: 16,
                  ),
                  KText(
                    '${currentUser?.displayName?.split(' ')[0] ?? ''} 👋',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ],
              ),*/
              const ColSpacing(4),
              /* Align(
                alignment: Alignment.centerLeft,
                child: KText(
                  'Here are the estimated donations',
                  fontSize: 16,
                  color: context.primary,
                ),
              ),*/
              /* LinearProgressIndicator(
                value: 0.6,
                minHeight: 10,
                borderRadius: BorderRadius.circular(16),
              ),
              ColSpacing(16),*/

              donations.when(
                  data: (data) {
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: context.secondaryContainer.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(16),
                            /*boxShadow: [
                              BoxShadow(
                                color: context.shadow.withOpacity(0.1),
                                blurRadius: 0,
                                offset: const Offset(0, 2),
                              ),
                            ],*/
                          ),
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: KText('Donation progress',
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                              Row(
                                children: [
                                  ProgressBarWidget(
                                      totalAmount: data.totalAmountAllTime),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      KText(
                                        '${data.totalAmountAllTime.toFiatCurrencyFormat(decimalDigits: 0)} kr',
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: data
                                            .totalAmountAllTime.donationColor,
                                      ),
                                      Container(
                                        width: 200,
                                        child: Divider(
                                          //thickness: 5,
                                          color: context.secondaryContainer,
                                          thickness: 2,
                                        ),
                                      ),
                                      KText(
                                        '3,000,000 kr',
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                  /*Transform.scale(
                                    scale: 1.4,
                                    child: SizedBox(
                                      height: 160,
                                      child: DoughnutChart(
                                        percentage: 1 -
                                            (data.totalAmountAllTime / 3000000) * 100,
                                      ),
                                    ),
                                  ),*/
                                ],
                              ),
                            ],
                          ),
                        ),
                        const ColSpacing(16),
                        Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          runAlignment: WrapAlignment.spaceBetween,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          runSpacing: 16,
                          spacing: 24,
                          children: [
                            RangedDonationWidget(
                                title: 'This week',
                                amount: data.totalAmountThisWeek
                                    .toFiatCurrencyFormat(decimalDigits: 0)),
                            RangedDonationWidget(
                                title: 'This month',
                                amount: data.totalAmountThisMonth
                                    .toFiatCurrencyFormat(decimalDigits: 0)),
                            RangedDonationWidget(
                                title: 'Past 3 months',
                                amount: data.totalAmountLast90Days
                                    .toFiatCurrencyFormat(decimalDigits: 0)),
                            RangedDonationWidget(
                                title: 'All time',
                                amount: data.totalAmountAllTime
                                    .toFiatCurrencyFormat(decimalDigits: 0))
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: DropdownButton(
                              value: chosenOption.value,
                              items: chartOptions
                                  .map((e) => DropdownMenuItem(
                                      value: e, child: Text(e)))
                                  .toList(),
                              onChanged: (value) {
                                chosenOption.value = value!;
                              }),
                        ),
                        BarChartWidget(
                          groupedDonations: data.donationsByMonthMap(
                              months:
                                  chosenOption.value.contains('6') ? 6 : 12),
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
            ],
          ),
        ),
      ),
    );
  }
}
