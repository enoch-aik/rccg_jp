import 'package:flutter_animate/flutter_animate.dart';
import 'package:rccg_jp/features/donations/data/models/donation_amount.dart';
import 'package:rccg_jp/features/donations/data/models/donor.dart';
import 'package:rccg_jp/features/donations/providers.dart';
import 'package:rccg_jp/features/onboarding/providers.dart';
import 'package:rccg_jp/lib.dart';
import 'package:rccg_jp/src/extensions/extensions.dart';
import 'package:rccg_jp/src/widgets/textfield/date_textfield.dart';
import 'package:uuid/uuid.dart';

class RecordDonation extends HookConsumerWidget {
  final Donor donor;

  const RecordDonation({super.key, required this.donor});

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amount = useTextEditingController();
    final ValueNotifier<String> currency = useState('SEK');
    final List<String> supportedCurrencies = ['SEK', 'EUR', 'USD'];
    final donatedAt = useTextEditingController();
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            KText(
              'Kindly fill in the following information below to record a donation for User',
              fontSize: 16,
              color: context.primary,
            ).animate().shimmer(duration: const Duration(seconds: 3)),
            const ColSpacing(32),
            CustomFormField(
              label: 'Amount',
              textField: DefaultTextFormField(
                controller: amount,
                keyboardType: TextInputType.number,
                hint: 'Enter amount donated here',
                validator: (String? text) {
                  if (text!.isEmpty) {
                    return 'Pledged amount is required';
                  }
                  return null;
                },
              ),
            ),
            CustomFormField(
              label: 'Currency',
              textField: DropdownButtonFormField<String>(
                value: currency.value,
                validator: (value) {
                  if (value == null) {
                    return 'Currency is required';
                  }
                  return null;
                },
                items: supportedCurrencies
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
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Loader.show(context);
                    final donationRepo = ref.read(donationRepoProvider);
                    final currentUser = ref.read(currentUserProvider);

                    NewDonation donation = NewDonation(
                      amount: amount.text.currencyToDouble,
                      donatedAt: donatedAt.text.toDateTime(),
                      donorName: donor.name,
                      donorId: donor.id,
                      donationId: const Uuid().v4(),
                      currencyShortName: currency.value,
                      insertedByName: currentUser?.displayName ?? 'unknown',
                      insertedByEmail: currentUser?.email ?? 'unknown',
                    );
                    Donor updatedDonorInfo = donor.copyWith(
                      lastDonationAt: DateTime.now(),
                      updatedAt: DateTime.now(),
                      donations: [
                        ...donor.donations,
                        donation,
                      ],
                    );
                    final result = await donationRepo.addDonation(
                        donation: donation, updatedDonorInfo: updatedDonorInfo);
                    if (context.mounted) {
                      Loader.hide(context);
                    }
                    result.when(
                      success: (data) {
                        context.router.popUntilRoot();
                        Toast.success(
                          'Donation recorded successfully',
                          context,
                        );
                      },
                      apiFailure: (e, _) {
                        AppNavigator.of(context).pop();
                        Toast.error(
                          'An error occurred while trying to record this donation, try again',
                          context,
                        );
                      },
                    );
                  }
                },
                child: const Text('Record donation'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void displayModal(BuildContext context, {required Donor donor}) {
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
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: RecordDonation(donor: donor),
      ),
    );
  }
}
