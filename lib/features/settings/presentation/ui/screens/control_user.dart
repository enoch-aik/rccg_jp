import 'package:rccg_jp/core/service_exceptions/service_exception.dart';
import 'package:rccg_jp/features/onboarding/providers.dart';
import 'package:rccg_jp/features/settings/providers.dart';
import 'package:rccg_jp/lib.dart';
import 'package:rccg_jp/src/extensions/extensions.dart';

@RoutePage(name: 'controlUser')
class ControlUserScreen extends HookConsumerWidget {
  const ControlUserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authorizedUsers = ref.watch(authorizedUsersProvider);
    final settingsRepo = ref.watch(settingsRepoProvider);
    final currentUser = ref.watch(currentUserProvider);
    return Scaffold(
      appBar: AppBar(
        title: const KText(
          'Control Users',
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        child: SizedBox(
            width: double.maxFinite,
            child: FilledButton(
                onPressed: () {
                  AppNavigator.of(context).push(AddNewUserModal());
                  // AddNewUserModalScreen.displayModal(context);
                },
                child: const Text('Add new user'))),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const ColSpacing(40),
            authorizedUsers.when(data: (data) {
              //data.removeWhere((element) => element.email == currentUser!.email);
              if (data
                  .where((e) => e.email != currentUser!.email)
                  .toList()
                  .isEmpty) {
                return SizedBox(
                  height: 500.h,
                  child: Center(
                    child: KText(
                      '⚠️  No user found',
                      fontSize: 16,
                      color: context.error,
                    ),
                  ),
                );
              }
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    if (currentUser!.email == data[index].email) {
                      return const SizedBox();
                    }
                    return ListTile(
                      title: Text(
                        data[index].email,
                        style: TextStyle(
                            color: context.primary,
                            fontWeight: FontWeight.w500),
                      ),
                      // subtitle: Text('user'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          Loader.show(context);
                          final result =
                              await settingsRepo.deleteUser(data[index].email);
                          if (context.mounted) {
                            Loader.hide(context);
                          }
                          result.when(
                              success: (data) {},
                              apiFailure: (e, _) {
                                Toast.error(e.message, context);
                              });
                        },
                      ),
                    );
                  });
            }, error: (e, _) {
              return const SizedBox();
            }, loading: () {
              return const SizedBox(
                height: 400,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
