/*
import 'package:flutter_animate/flutter_animate.dart';
import 'package:rccg_jp/lib.dart';
import 'package:rccg_jp/src/extensions/context.dart';
import 'package:rccg_jp/src/widgets/textfield/date_textfield.dart';

@RoutePage(name: 'recordDonation')
class RecordDonationScreen extends HookConsumerWidget {
  const RecordDonationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final donationDate = useTextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: KText('Record a new donation'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              KText(
                'Record a new donation',
                fontSize: 16.sp,
                color: context.primary,
              ).animate().shimmer(duration: const Duration(seconds: 3)),
              ColSpacing(32.h),
              CustomFormField(
                label: 'Amount',
                textField: DefaultTextFormField(
                  keyboardType: TextInputType.number,
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
                          child: KText(currency),
                        ),
                      )
                      .toList(),
                  onChanged: (String? value) {},
                ),
              ),
              CustomFormField(
                label: 'Donated at',
                textField: DateTextField(
                  date: donationDate,
                  hintText: 'Donated at',
                ),
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
            ],
          ),
        ));
  }
}
*/
