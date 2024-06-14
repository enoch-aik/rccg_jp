import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:rccg_jp/core/formatters/currency_formatter.dart';
import 'package:rccg_jp/core/validators/text_field_validators.dart';
import 'package:rccg_jp/features/donations/data/models/donor.dart';
import 'package:rccg_jp/features/donations/presentation/ui/modals/confirm_new_donor.dart';
import 'package:rccg_jp/lib.dart';
import 'package:rccg_jp/src/extensions/extensions.dart';
import 'package:uuid/uuid.dart';

@RoutePage(name: 'addDonor')
class AddDonorScreen extends HookConsumerWidget {
  const AddDonorScreen({super.key});

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController fullName = useTextEditingController();
    final TextEditingController email = useTextEditingController();
    final TextEditingController phoneNumber = useTextEditingController();
    final TextEditingController pledgedAmount = useTextEditingController();
    final ValueNotifier<int?> installmentMonth = useState(null);
    final ValueNotifier<String> currency = useState('SEK');
    final List<String> supportedCurrencies = ['SEK', 'EUR', 'USD'];
    final validateMode = useState<AutovalidateMode>(AutovalidateMode.disabled);
    final phoneNumberCountry = useState<Country?>(countries.firstWhere(
        (country) => country.code == 'SE',
        orElse: () => countries.first));

    return Scaffold(
      appBar: AppBar(
        title: const KText(
          'Add new Donor',
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: validateMode.value,
        child: SingleChildScrollView(
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
                  validator: (String? text) {
                    if (text!.isEmpty) {
                      return 'Full name is required';
                    }
                    return null;
                  },
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
                        return null;
                      }
                    } else if (text.isEmpty) {
                      return 'Email address is required';
                    }
                    return null;
                  },
                ),
              ),
              CustomFormField(
                label: 'Phone number',
                bottomPadding: 4,
                textField: IntlPhoneField(
                  controller: phoneNumber,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 0),
                      counter: SizedBox()),
                  initialCountryCode: 'SE',
                  onCountryChanged: (country) {
                    phoneNumberCountry.value = country;
                  },
                  validator: (number) {
                    if (number?.number.isEmpty ?? false) {
                      return 'Phone number is required';
                    }
                    if (number!.number.length < 8) {
                      return 'Phone number is too short';
                    } else {
                      if (!number.isValidNumber()) {
                        return 'Invalid phone number';
                      }
                    }

                    return null;
                  },
                ),
              ),
              CustomFormField(
                label: 'Currency',
                textField: DropdownButtonFormField(
                  value: currency.value,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10,right: 8),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Currency is required';
                    }
                    return null;
                  },
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
                  validator: (String? text) {
                    if (text!.isEmpty) {
                      return 'Pledged amount is required';
                    }
                    return null;
                  },
                ),
              ),
              CustomFormField(
                label: 'How many month installments?',
                textField: DropdownButtonFormField(
                  value: installmentMonth.value,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10,right: 8),
                  ),
                  items: (List.generate(12, (index) => index + 1)
                      .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e > 1 ? '$e  months' : '$e  month')))
                      .toList() as List<DropdownMenuItem>),
                  onChanged: (value) {
                    installmentMonth.value = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Installment is required';
                    }
                    return null;
                  },
                ),
              ),
              const ColSpacing(24),
              SizedBox(
                width: double.maxFinite,
                child: FilledButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Donor donor = Donor(
                            id: const Uuid().v4(),
                            name: fullName.text,
                            email: email.text,
                            phoneNumber:
                                '+${phoneNumberCountry.value!.dialCode}${phoneNumber.text}',
                            currencyShortName: currency.value,
                            pledgedAmount: double.parse(
                                pledgedAmount.text.removeCommaAndDot),
                            installmentMonth: installmentMonth.value!,
                            pledgedAt: DateTime.now(),
                            updatedAt: DateTime.now(),
                            lastDonationAt: DateTime.now(),
                            donations: []);

                        //show bottom sheet to confirm details
                        ConfirmNewDonor.displayModal(context, donor: donor);
                      } else {
                        validateMode.value = AutovalidateMode.onUserInteraction;
                      }
                    },
                    child: const Text('Continue')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
