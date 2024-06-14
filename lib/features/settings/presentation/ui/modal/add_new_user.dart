import 'package:flutter_animate/flutter_animate.dart';
import 'package:rccg_jp/core/validators/text_field_validators.dart';
import 'package:rccg_jp/lib.dart';
import 'package:rccg_jp/src/extensions/extensions.dart';

class AddNewUserModal extends HookConsumerWidget {
  const AddNewUserModal({super.key});

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = useTextEditingController();
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            KText(
              'Kindly fill in the following information below to add a new user to this app',
              fontSize: 16,
              color: context.primary,
            ).animate().shimmer(duration: const Duration(seconds: 3)),
            const ColSpacing(32),
            Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: CustomFormField(
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
            ),
            SizedBox(
              width: double.maxFinite,
              child: FilledButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Loader.show(context);
                  }
                },
                child: const Text('Add new user'),
              ),
            ),
          ],
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
        child: AddNewUserModal(),
      ),
    );
  }
}
