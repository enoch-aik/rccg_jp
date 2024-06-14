import 'package:rccg_jp/features/settings/presentation/ui/modal/add_new_user.dart';
import 'package:rccg_jp/features/settings/providers.dart';
import 'package:rccg_jp/lib.dart';
import 'package:rccg_jp/src/extensions/extensions.dart';

@RoutePage(name: 'addNewUser')
class AddNewUserScreen extends HookConsumerWidget {
  const AddNewUserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authorizedUsers = ref.watch(authorizedUsersProvider);

    return Scaffold(
      appBar: AppBar(
        title: KText(
          'Add New User',
          fontSize: 15,
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        child: SizedBox(
            width: double.maxFinite,
            child: FilledButton(onPressed: () {
              AddNewUserModal.displayModal(context);

            }, child: Text('Add new user'))),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            ColSpacing(40),
            authorizedUsers.when(data: (data) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        data[index].email,
                        style: TextStyle(
                            color: context.primary,
                            fontWeight: FontWeight.w500),
                      ),
                      // subtitle: Text('user'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {},
                      ),
                    );
                  });
            }, error: (e, _) {
              return SizedBox();
            }, loading: () {
              return SizedBox(
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
