import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import './signup_login_button.dart';
import '../routes/route_names.dart';

class GetStartedButtomSheet extends ConsumerWidget {
  const GetStartedButtomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 28,
              ),
              Expanded(
                child: Text(
                  'Welcome to X-wash',
                  style: TextStyle(
                    color: theme.primaryColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close),
              )
            ],
          ),
          Divider(thickness: 1, color: theme.primaryColor.withOpacity(.3)),
          const SizedBox(height: 20),
          SignupLoginButton(
            onTap: () {},
            icon: Icons.whatsapp_rounded,
            color: Colors.green,
            text: 'Signup/Login WhatsApp (faster)',
          ),
          const SizedBox(height: 30),
          SignupLoginButton(
            onTap: () =>context.pushNamed(RouteName.signup),
            icon: Icons.call_outlined,
            color: theme.primaryColor,
            text: 'Signup/Login With Mobile',
          ),
        ],
      ),
    );
  }
}