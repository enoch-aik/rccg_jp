import 'package:rccg_jp/features/settings/data/models/currency.dart';
import 'package:rccg_jp/features/settings/providers.dart';
import 'package:rccg_jp/lib.dart';

@RoutePage(name: 'preferences')
class PreferencesScreen extends HookConsumerWidget {
  const PreferencesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencies = ref.watch(appCurrencyProvider);
    final ValueNotifier<Currency> selectedCurrency =
        useState(ref.watch(selectedCurrencyProvider));
    return Scaffold(
      appBar: AppBar(
        title: const KText(
          'Preferences',
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const ColSpacing(40),
            currencies.when(data: (data) {
              List<Currency> currencies = data;

              return CustomFormField(
                label: 'Select currency',
                textField: DropdownButtonFormField<Currency>(
                  value: selectedCurrency.value,
                  items: currencies
                      .map((e) => DropdownMenuItem(
                          value: e, child: Text('${e.name} (${e.symbol})')))
                      .toList(),
                  onChanged: (Currency? value) {
                    //  ref.read(settingsRepoProvider).setCurrency(value!.name);
                  },
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 8),
                  ),
                ),
              );
            }, error: (e, _) {
              return const SizedBox();
            }, loading: () {
              return const SizedBox();
            }),
            const ColSpacing(64),
            if (currencies.hasValue)
              SizedBox(
                width: double.maxFinite,
                child: FilledButton(
                  onPressed: () {},
                  child: const Text('Save preferences'),
                ),
              )
          ],
        ),
      ),
    );
  }
}
