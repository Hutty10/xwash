import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screens/profile_screen.dart';

class CategoryBottomSheet extends ConsumerWidget {
  const CategoryBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const SizedBox(width: 35),
            Expanded(
              child: Text(
                'X-wash',
                style: TextStyle(
                  color: theme.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.close,
                color: theme.primaryColor,
              ),
            ),
            const SizedBox(width: 10)
          ],
        ),
        Divider(
          color: theme.primaryColor.withOpacity(.25),
          thickness: .9,
        ),
        const SizedBox(height: 15),
        ProfileCard(
          text: 'Shoe & Bag Care',
          leadingImg: 'assets/images/bag.png',
          onTap: () {},
        ),
        const SizedBox(height: 10),
        ProfileCard(
          text: 'Clean & Press',
          leadingImg: 'assets/images/bag.png',
          onTap: () {},
        ),
        const SizedBox(height: 10),
        ProfileCard(
          text: 'Home Care',
          leadingImg: 'assets/images/bag.png',
          onTap: () {},
        ),
        const SizedBox(height: 10),
        ProfileCard(
          text: 'Wash & Fold',
          leadingImg: 'assets/images/bag.png',
          onTap: () {},
        ),
        const SizedBox(height: 10),
        ProfileCard(
          text: 'Press Only',
          leadingImg: 'assets/images/bag.png',
          onTap: () {},
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
