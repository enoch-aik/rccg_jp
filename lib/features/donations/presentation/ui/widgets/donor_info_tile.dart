import 'package:rccg_jp/lib.dart';

class DonorInfoTile extends StatelessWidget {
  final String title;
  final String value;
  final void Function()? onTap;
  final bool addUnderline;

  const DonorInfoTile({
    super.key,
    required this.title,
    required this.value,
    this.addUnderline = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          KText(
            '$title:',
            fontSize: 16,
          ),
          KText(
            value,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            decoration:addUnderline? TextDecoration.underline:null,
          ),
        ],
      ),
    );
  }
}
