import 'package:rccg_jp/features/settings/providers.dart';
import 'package:rccg_jp/lib.dart';
import 'package:rccg_jp/src/extensions/context.dart';
import 'package:rccg_jp/src/widgets/currency_text.dart';

class RangedDonationWidget extends HookConsumerWidget {
  final String title;
  final String amount;

  const RangedDonationWidget(
      {super.key, required this.title, required this.amount});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: context.primaryContainer,
        boxShadow: [
          BoxShadow(
            color: context.shadow.withOpacity(0.01),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          KText(title, fontSize: 16),
          const ColSpacing(8),
          KCurrencyText(
            amount,
            currency: ref.watch(selectedCurrencyProvider),
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: context.primary,
          ),
        ],
      ),
    );
  }
}
