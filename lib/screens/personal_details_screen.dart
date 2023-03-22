import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../widgets/category_bottomsheet.dart';
import '../widgets/form_fields.dart';
import '../widgets/support_dialog.dart';

class PersonalDetailsScreen extends ConsumerStatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends ConsumerState<PersonalDetailsScreen> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _firstNameController,
      _lastNameController,
      _numberController,
      _emailController;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _firstNameController = TextEditingController(text: 'Hutty');
    _lastNameController = TextEditingController();
    _numberController = TextEditingController();
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _numberController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(.1),
          foregroundColor: theme.primaryColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          actions: [
            IconButton(
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: (context) => const CategoryBottomSheet(),
              ),
              icon: Icon(
                Icons.monetization_on_outlined,
                size: 32,
                color: theme.primaryColor,
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: () => showDialog(
                context: context,
                builder: (_) => const SupportDialog(),
              ),
              padding: const EdgeInsets.only(right: 30),
              icon: Icon(
                Icons.chat_outlined,
                size: 32,
                color: theme.primaryColor,
              ),
            ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              Text(
                'Edit Personal Details',
                style: TextStyle(
                  color: theme.primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextFieldWithLabel(
                controller: _firstNameController,
                label: 'First name',
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  } else {
                    return 'First name must not be empty';
                  }
                },
              ),
              TextFieldWithLabel(
                controller: _lastNameController,
                label: 'Last name',
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  } else {
                    return 'Last name must not be empty';
                  }
                },
              ),
              TextFieldWithLabel(
                controller: _numberController,
                label: 'Mobile Number',
              ),
              TextFieldWithLabel(
                controller: _emailController,
                label: 'Email Address',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return "Please enter a valid email address";
                  }
                  return null;
                },
              ),
              TextFieldWithLabel(
                label: 'Account',
                initialValue: 'Delete your account',
                readOnly: true,
                suffix: GestureDetector(
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => const DeleteAccountDialog(),
                  ),
                  child: Text(
                    'Delete',
                    style: TextStyle(
                      color: theme.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: null,
                style: TextButton.styleFrom(
                  foregroundColor: theme.primaryColor,
                  disabledForegroundColor: theme.primaryColor.withOpacity(.55),
                ),
                child: const Text(
                  'Save Changes',
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: .5,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Delete your account',
              style: TextStyle(
                color: theme.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Deleting your account will also delete all your personal data. You will need to create a new account if you return',
              style: TextStyle(color: theme.primaryColor, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.primaryColor,
                fixedSize: Size(MediaQuery.of(context).size.width, 40),
              ),
              child: const Text(
                'Delete my account',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: TextButton.styleFrom(
                foregroundColor: theme.primaryColor,
              ),
              child: const Text(
                'cancel',
                style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
