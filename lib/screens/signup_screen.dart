import 'package:extended_phone_number_input/consts/enums.dart';
import 'package:extended_phone_number_input/phone_number_controller.dart';
import 'package:extended_phone_number_input/phone_number_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../routes/route_names.dart';
import '../widgets/support_dialog.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  late PhoneNumberInputController _phoneNumberController;
  bool _numberValid = false;
  @override
  void initState() {
    _phoneNumberController = PhoneNumberInputController(context);
    super.initState();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        // backgroundColor: ,
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(.1),
          foregroundColor: theme.primaryColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          title: const Text(
            ' Step 1 of 2',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
          actions: [
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Mobile Number',
                    style: TextStyle(
                      color: theme.primaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'We\'ll only call you if we need to follow up on an order',
                    style: TextStyle(
                      color: theme.primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Mobile Number',
                    style: TextStyle(
                        color: theme.primaryColor, fontWeight: FontWeight.w600),
                  ),
                  PhoneNumberInput(
                    controller: _phoneNumberController,
                    onChanged: (val) {
                      if (_phoneNumberController.phoneNumber.length >= 10 &&
                          _phoneNumberController.phoneNumber.length <= 11) {
                        setState(() => _numberValid = true);
                      } else {
                        setState(() => _numberValid = false);
                      }
                    },
                    errorText: 'Phone number is required',
                    initialCountry: 'NG',
                    locale: 'en_NG',
                    countryListMode: CountryListMode.bottomSheet,
                    allowPickFromContacts: false,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: theme.primaryColor),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Divider(
                    thickness: 1,
                    height: 0,
                    color: theme.primaryColor.withOpacity(.3),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: _numberValid
                        ? () => context.goNamed(RouteName.home)
                        : null,
                    icon: const FaIcon(FontAwesomeIcons.whatsapp),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(size.width - 40, 43),
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white.withOpacity(.9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    label: const Text(
                      'Send Code via whatsApp',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _numberValid
                        ? () {
                            FocusScope.of(context).unfocus();
                            context.goNamed(RouteName.home);
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(size.width - 40, 43),
                      backgroundColor: theme.primaryColor,
                      foregroundColor: Colors.white.withOpacity(.9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    child: const Text(
                      'Send Code via SMS',
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
