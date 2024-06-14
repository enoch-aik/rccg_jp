import 'package:cached_network_image/cached_network_image.dart';
import 'package:rccg_jp/features/onboarding/providers.dart';
import 'package:rccg_jp/features/settings/presentation/ui/widgets/action_tile.dart';
import 'package:rccg_jp/features/settings/providers.dart';
import 'package:rccg_jp/lib.dart';
import 'package:rccg_jp/src/extensions/extensions.dart';
import 'package:rccg_jp/src/res/assets/svg/svg.dart';
import 'package:rccg_jp/src/widgets/init_icon.dart';

@RoutePage(name: 'settings')
class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);
    final authorizedUsers = ref.watch(authorizedUsersProvider);
    return Scaffold(
      body: SingleChildScrollView(
        //   padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ColSpacing(48),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                        text: currentUser?.displayName ?? '',
                        backgroundColor: context.primary,
                      ),
                      errorWidget: (context, url, error) => Initicon(
                        text: currentUser?.displayName ?? '',
                        backgroundColor: context.primary,
                      ),
                    ),
                  ),
                  const RowSpacing(16),
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
            const Divider(),
            const ColSpacing(16),
            Column(
              children: [
                authorizedUsers.when(
                    data: (data) {
                      if (data.isNotEmpty &&
                          data.where((user) {
                            return (user.email == currentUser?.email) &&
                                (user.isAdmin);
                          }).isNotEmpty) {
                        return ActionTile(
                            title: 'Control users',
                            subtitle: 'Add or remove app users',
                            icon: adminControlIcon,
                            onTap: () {
                              AppNavigator.of(context).push(const AddNewUser());
                              //  context.router.push(const UserManagement());
                            });
                      }

                      return const SizedBox();
                    },
                    error: (e, _) => Text(e.toString()),
                    loading: () => const SizedBox()),
                ActionTile(
                    title: 'Preferences',
                    subtitle: 'Customize your app experience',
                    icon: preferencesIcon,
                    onTap: () {
                      Toast.info('Coming soon', context,
                          title: 'Feature not available yet');
                    }),
                ActionTile(
                  title: 'Logout',
                  subtitle: 'Sign out of your account',
                  icon: logoutIcon,
                  onTap: () async {
                    Loader.show(context);
                    final auth = ref.read(firebaseAuthProvider);
                    Loader.hide(context);
                    await auth.signOut().whenComplete(() {
                      ref.read(currentUserProvider.notifier).state = null;
                      context.router.replaceAll([const Onboarding()]);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
