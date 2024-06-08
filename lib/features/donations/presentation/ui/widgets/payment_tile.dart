import 'package:flutter_svg/flutter_svg.dart';
import 'package:rccg_jp/lib.dart';
import 'package:rccg_jp/src/extensions/extensions.dart';
import 'package:rccg_jp/src/res/assets/svg/svg.dart';

class PaymentTile extends StatelessWidget {
  const PaymentTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: context.shadow.withOpacity(0.01),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            donationOutlinedIcon,
            width: 32,
            color: Color(0xff006E1C),
          ),
          RowSpacing(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KText(
                'Donation',
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              ColSpacing(2),
              KText(
                DateTime.now().timeAgo(),
                color: context.outline,
                fontSize: 15,
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              KText(
                '+10,000Kr',
                fontWeight: FontWeight.w900,
                color: Color(0xff006E1C),
                fontSize: 16,
              ),
              KText(
                'Transfer',
                fontSize: 14,
                color: context.outline,
              ),
            ],
          ),
        ],
      ),
    )

        /*ListTile(
      onTap: (){},
      tileColor: context.primary,
      selectedTileColor: context.background,
      leading: Icon(Icons.call_received),
      title: Text('10,000Kr'),
      subtitle: Text(DateTime.now().timeAgo()),
    )*/
        ;
  }
}
