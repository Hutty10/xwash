import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../services/auth_service.dart';
import './signup_login_button.dart';
import '../routes/route_names.dart';

class GetStartedBottomSheet extends ConsumerStatefulWidget {
  const GetStartedBottomSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GetStartedBottomSheet();
}

class _GetStartedBottomSheet extends ConsumerState<GetStartedBottomSheet> {
  @override
  Widget build(BuildContext context) {
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
            onTap: () async {
              final ConnectivityResult connectivityResult =
                  await (Connectivity().checkConnectivity());
              if (connectivityResult == ConnectivityResult.mobile ||
                  connectivityResult == ConnectivityResult.wifi) {
                ref.read(authServiceProvider).googleLogin();
              } else {
                // ignore: use_build_context_synchronously
                showDialog(
                  context: context,
                  builder: (context) => const NetworkDialog(),
                );
              }
            },
            img: 'assets/images/google_icon.png',
            color: Colors.black87,
            text: 'Signup/Login Google (faster)',
          ),
          const SizedBox(height: 30),
          SignupLoginButton(
            onTap: () {
              Navigator.of(context).pop();
              context.pushNamed(RouteName.signup);
            },
            icon: Icons.call_outlined,
            iconColor: Colors.white.withOpacity(.8),
            color: theme.primaryColor,
            text: 'Signup/Login With Mobile',
          ),
        ],
      ),
    );
  }
}

class NetworkDialog extends StatelessWidget {
  const NetworkDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Network Error',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 17,
                  ),
                ),
                Icon(
                  Icons.warning,
                  color: Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              'Unable to connect. Please check your internet connection.',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
