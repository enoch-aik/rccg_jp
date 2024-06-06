import 'package:rccg_jp/lib.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final Widget textField;
  final double? labelFontSize;
  final double? bottomPadding;

  const CustomFormField({
    super.key,
    required this.label,
    required this.textField,
    this.labelFontSize,
    this.bottomPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontSize: labelFontSize),
        ),
        ColSpacing(8.h),
        textField,
        ColSpacing(bottomPadding ?? 16.h),
      ],
    );
  }
}
