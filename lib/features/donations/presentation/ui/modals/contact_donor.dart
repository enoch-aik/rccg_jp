import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:rccg_jp/lib.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactModal extends StatelessWidget {
  final String phoneNumber;
  final String donorName;
  final String emailAddress;

  const ContactModal(
      {super.key,
      required this.phoneNumber,
      required this.emailAddress,
      required this.donorName});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          KText(
            'Contact $donorName using any of the options below:',
            fontSize: 15,
          ),
          const ColSpacing(16),
          SizedBox(
            width: double.maxFinite,
            child: OutlinedButton(
              onPressed: () async {
                await FlutterPhoneDirectCaller.callNumber(phoneNumber);
              },
              child: const Text('Phone call'),
            ),
          ),
          const ColSpacing(4),
          SizedBox(
            width: double.maxFinite,
            child: FilledButton(
              onPressed: () async {
                String? encodeQueryParameters(Map<String, String> params) {
                  return params.entries
                      .map(
                        (MapEntry<String, String> e) =>
                            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
                      )
                      .join('&');
                }

                final Uri emailLaunchUri = Uri(
                  scheme: 'mailto',
                  path: emailAddress,
                  query: encodeQueryParameters(<String, String>{
                    'subject': 'RCCG Jesus Partner Donation',
                  }),
                );
                if (await canLaunchUrl(emailLaunchUri)) {
                  launchUrl(emailLaunchUri);
                }
              },
              child: const Text('Send an email'),
            ),
          ),
        ],
      ),
    );
  }

  static void displayModal(
    BuildContext context, {
    required String phoneNumber,
    required String email,
    required String name,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      constraints: BoxConstraints.tightFor(
        height: 192.h,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
      ),
      builder: (context) => ContactModal(
        phoneNumber: phoneNumber,
        emailAddress: email,
        donorName: name,
      ),
    );
  }
}
