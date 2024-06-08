import 'package:flutter_animate/flutter_animate.dart';
import 'package:rccg_jp/lib.dart';
import 'package:rccg_jp/src/extensions/extensions.dart';
import 'package:rccg_jp/src/widgets/textfield/date_textfield.dart';

class RecordDonation extends HookConsumerWidget {
  const RecordDonation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amount = useTextEditingController();
    final ValueNotifier<String> currency = useState('SEK');
    final List<String> supportedCurrencies = ['SEK', 'EUR', 'USD'];
    final donatedAt = useTextEditingController();
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        children: [
          KText(
            'Kindly fill in the following information below to record a donation for User',
            fontSize: 16,
            color: context.primary,
          ).animate().shimmer(duration: const Duration(seconds: 3)),
          const ColSpacing(32),
          const CustomFormField(
            label: 'Amount',
            textField: DefaultTextFormField(
              keyboardType: TextInputType.number,
              hint: 'Enter amount donated here',
            ),
          ),
          CustomFormField(
            label: 'Currency',
            textField: DropdownButtonFormField<String>(
              value: 'SEK',
              items: ['SEK', 'EUR', 'USD']
                  .map(
                    (String currency) => DropdownMenuItem(
                      value: currency,
                      child: Row(
                        children: [
                          Text(switch (currency) {
                            'SEK' => 'Swedish Krona (SEK)',
                            'EUR' => 'Euro (EUR)',
                            'USD' => 'US Dollar (USD)',
                            String() => '',
                          }),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (String? value) {},
            ),
          ),
          CustomFormField(
              label: 'Donated at',
              textField: DateTextField(
                date: donatedAt,
                hintText: 'Enter donation date here',
              )),
          ColSpacing(32.h),
          SizedBox(
            width: double.maxFinite,
            child: FilledButton(
              onPressed: () {
                AppNavigator.of(context).pop();
              },
              child: const Text('Record donation'),
            ),
          ),
        ],
      ),
    );
  }

  static void displayModal(BuildContext context) {
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
      builder: (context) => const RecordDonation(),
    );
  }
}
