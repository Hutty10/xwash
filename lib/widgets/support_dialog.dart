import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'icon_label.dart';

class SupportDialog extends ConsumerWidget {
  const SupportDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 30),
                Expanded(
                  child: Text(
                    'X-wash',
                    style: TextStyle(
                      color: theme.primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                  color: theme.primaryColor,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Text(
                'Our support center is available to assist you every day between',
                style: TextStyle(
                  color: theme.primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              '9:00 AM : 10:30PM',
              style: TextStyle(
                color: theme.primaryColor,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconWithLabel(
                    onTap: () {},
                    icon: Icons.call_outlined,
                    text: 'Call',
                  ),
                  IconWithLabel(
                    onTap: () {},
                    icon: Icons.chat_outlined,
                    text: 'Chat',
                  ),
                  IconWithLabel(
                    onTap: () {},
                    icon: Icons.email_outlined,
                    text: 'Email',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}