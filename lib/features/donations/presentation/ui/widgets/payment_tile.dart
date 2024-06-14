import 'package:flutter_svg/flutter_svg.dart';
import 'package:rccg_jp/features/donations/data/models/donation_amount.dart';
import 'package:rccg_jp/lib.dart';
import 'package:rccg_jp/src/extensions/extensions.dart';
import 'package:rccg_jp/src/res/assets/svg/svg.dart';

class PaymentTile extends StatelessWidget {
  final NewDonation donation;
  final bool isDashboard= false;

  const PaymentTile({super.key, required this.donation});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: context.shadow.withOpacity(0.01),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            donationOutlinedIcon,
            width: 32,
            color: const Color(0xff006E1C),
          ),
          const RowSpacing(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               KText(
              isDashboard?  donation.donorName :'Donation',
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              const ColSpacing(2),
              KText(
                donation.donatedAt.timeAgo(),
                color: context.outline,
                fontSize: 15,
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
             /* IconButton(iconSize: 20,
                  padding: EdgeInsets.zero,
                  onPressed: (){}, icon: Icon(Icons.info_outline)),*/
              KText(
                'Transfer',
                fontSize: 14,
                color: context.outline,
              ),
              KText(
                '+${donation.amount.toFiatCurrencyFormat(decimalDigits: 0)}',
                fontWeight: FontWeight.w900,
                color: const Color(0xff006E1C),
                fontSize: 16,
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
