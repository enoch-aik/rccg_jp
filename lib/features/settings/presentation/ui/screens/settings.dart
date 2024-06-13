import 'package:cached_network_image/cached_network_image.dart';
import 'package:rccg_jp/features/onboarding/providers.dart';
import 'package:rccg_jp/lib.dart';
import 'package:rccg_jp/src/extensions/extensions.dart';
import 'package:rccg_jp/src/widgets/init_icon.dart';

@RoutePage(name: 'settings')
class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);
    return Scaffold(
      body: SingleChildScrollView(
     //   padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColSpacing(48),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  ClipOval(
                    child: CachedNetworkImage(
                      height: 56,
                      width: 56,
                      alignment: Alignment.center,
                      imageUrl: currentUser?.photoURL ?? '',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Initicon(
                        text: currentUser!.displayName!,
                        backgroundColor: context.primary,
                      ),
                      errorWidget: (context, url, error) => Initicon(
                        text: currentUser!.displayName!,
                        backgroundColor: context.primary,
                      ),
                    ),
                  ),
                  RowSpacing(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      KText(
                        currentUser?.displayName ?? '',
                        fontSize: 16,
                        //fontWeight: FontWeight.w500,
                      ),
                      KText(
                        currentUser?.email ?? '',
                        fontSize: 14,
                        color: context.tertiary,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  )
                ],
              ),
            ),

            Divider(),
          ],
        ),
      ),
    );
  }
}
