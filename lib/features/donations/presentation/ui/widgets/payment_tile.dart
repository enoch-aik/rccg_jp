import 'package:rccg_jp/lib.dart';
import 'package:rccg_jp/src/extensions/extensions.dart';

class PaymentTile extends StatelessWidget {
  const PaymentTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: context.secondaryContainer,
      ),
      child: Row(
        children: [
          Icon(Icons.call_received),
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
          KText(
            '+10,000Kr',
            fontWeight: FontWeight.w600,
            fontSize: 16,
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
