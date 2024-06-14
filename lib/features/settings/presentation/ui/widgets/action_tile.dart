import 'package:flutter_svg/flutter_svg.dart';
import 'package:rccg_jp/lib.dart';
import 'package:rccg_jp/src/extensions/context.dart';

class ActionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;
  final VoidCallback onTap;

  const ActionTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      leading: SvgPicture.asset(icon),
      titleAlignment: ListTileTitleAlignment.center,
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: KText(
          title,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: KText(
          subtitle,
          fontSize: 12,
          color: context.outline,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}
