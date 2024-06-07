import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:rccg_jp/core/formatters/currency_formatter.dart';
import 'package:rccg_jp/core/validators/text_field_validators.dart';
import 'package:rccg_jp/features/donations/data/models/donor.dart';
import 'package:rccg_jp/features/donations/presentation/ui/modals/confirm_new_donor.dart';
import 'package:rccg_jp/lib.dart';
import 'package:rccg_jp/src/extensions/extensions.dart';

@RoutePage(name: 'addDonor')
class AddDonorScreen extends HookConsumerWidget {
  const AddDonorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController fullName = useTextEditingController();
    final TextEditingController email = useTextEditingController();
    final TextEditingController phoneNumber = useTextEditingController();
    final TextEditingController pledgedAmount = useTextEditingController();
    final ValueNotifier<InstallmentMonth?> installmentMonth = useState(null);
    final ValueNotifier<String> currency = useState('SEK');
    final List<String> supportedCurrencies = ['SEK', 'EUR', 'USD'];

    return Scaffold(
      appBar: AppBar(
        title: const KText(
          'Add new Donor',
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            KText(
              'Kindly fill in the information below to add a new donor',
              fontSize: 16.sp,
              color: context.primary,
            ).animate().shimmer(duration: const Duration(seconds: 3)),
            ColSpacing(32.h),
            CustomFormField(
              label: 'Full name',
              textField: DefaultTextFormField(
                controller: fullName,
              ),
            ),
            CustomFormField(
              label: 'Email',
              textField: DefaultTextFormField(
                controller: email,
                validator: (String? text) {
                  if (text!.isNotEmpty) {
                    if (!TextFieldValidator.emailExp.hasMatch(text)) {
                      return 'Please provide a valid email address';
                    } else {
                      return 'Invalid email address';
                    }
                  } else {
                    return 'Email address is required';
                  }
                },
              ),
            ),
            CustomFormField(
              label: 'Telephone',
              textField: IntlPhoneField(
                controller: phoneNumber,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 0),
                    counter: SizedBox()),
                initialCountryCode: 'SE',
              ),
            ),
            CustomFormField(
              label: 'Currency',
              textField: DropdownButtonFormField(
                value: currency.value,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                ),
                items: (supportedCurrencies
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Row(
                          children: [
                            Text(switch (e) {
                              'SEK' => 'Swedish Krona (SEK)',
                              'EUR' => 'Euro (EUR)',
                              'USD' => 'US Dollar (USD)',
                              String() => '',
                            }),
                          ],
                        ),
                      ),
                    )
                    .toList()),
                onChanged: (value) {
                  if (value != null) {
                    currency.value = value;
                  }
                },
              ),
            ),
            CustomFormField(
              label: 'Pledged amount',
              textField: DefaultTextFormField(
                controller: pledgedAmount,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CurrencyTextInputFormatter(symbol: '', decimalDigits: 0)
                ],
              ),
            ),
            CustomFormField(
              label: 'How many month installments?',
              textField: DropdownButtonFormField(
                value: installmentMonth.value,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                ),
                items: (InstallmentMonth.values
                    .map((e) =>
                        DropdownMenuItem(value: e, child: Text(e.getName)))
                    .toList() as List<DropdownMenuItem>),
                onChanged: (value) {
                  installmentMonth.value = value;
                },
              ),
            ),
            ColSpacing(24),
            SizedBox(
              width: double.maxFinite,
              child: FilledButton(
                  onPressed: () {
                    Donor donor = Donor(
                        name: fullName.text,
                        email: email.text,
                        phoneNumber: phoneNumber.text,
                        currencyShortName: currency.value,
                        amount: double.parse(
                            pledgedAmount.text.removeCommaAndDot.split(' ')[1]),
                        installmentMonth: installmentMonth.value!,
                        pledgedAt: DateTime.now(),
                        updatedAt: DateTime.now(),
                        lastDonationAt: DateTime.now(),
                        donations: []);

                    //show bottom sheet to confirm details
                    ConfirmNewDonor.displayModal(context, donor: donor);
                  },
                  child: const Text('Continue')),
            )
          ],
        ),
      ),
    );
  }
}
