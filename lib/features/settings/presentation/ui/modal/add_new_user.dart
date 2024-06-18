import 'package:flutter_animate/flutter_animate.dart';
import 'package:rccg_jp/core/service_exceptions/service_exception.dart';
import 'package:rccg_jp/core/validators/text_field_validators.dart';
import 'package:rccg_jp/features/settings/providers.dart';
import 'package:rccg_jp/lib.dart';
import 'package:rccg_jp/src/extensions/extensions.dart';

@RoutePage(name: 'addNewUserModal')
class AddNewUserModalScreen extends HookConsumerWidget {
  const AddNewUserModalScreen({super.key});

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsRepo = ref.watch(settingsRepoProvider);
    final email = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const KText(
          'Add a new user',
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              KText(
                'Kindly fill in the email address of the user that you would like to add to this app',
                fontSize: 17,
                color: context.primary,
              ).animate().shimmer(duration: const Duration(seconds: 3)),
              const ColSpacing(54),
              CustomFormField(
                label: 'Email',
                textField: DefaultTextFormField(
                  controller: email,
                  keyboardType: TextInputType.number,
                  hint: 'Enter email here',
                  validator: (String? text) {
                    if (text!.isEmpty) {
                      return 'Email address is required';
                    }
                    if (!TextFieldValidator.emailExp.hasMatch(text)) {
                      return 'Invalid email address';
                    }
                    return null;
                  },
                ),
              ),
              const ColSpacing(16),
              SizedBox(
                width: double.maxFinite,
                child: FilledButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      Loader.show(context);
                      final result = await settingsRepo.addUser(email.text);
                      if (context.mounted) {
                        Loader.hide(context);
                      }
                      result.when(
                        success: (data) {
                          AppNavigator.of(context).pop();
                          //context.router.popUntilRoot();
                          Toast.success('User added successfully', context);
                        },
                        apiFailure: (e, _) {
                          Toast.error(e.message, context);
                        },
                      );
                    }
                  },
                  child: const Text('Add new user'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void displayModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      /*constraints: BoxConstraints.tightFor(
      // height: 300.h,
      ),*/
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: AddNewUserModalScreen(),
      ),
    );
  }
}
