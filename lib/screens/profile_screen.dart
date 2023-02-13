import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../widgets/support_dialog.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
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
            onPressed: () {},
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
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        children: [
          Text(
            'Profile',
            style: TextStyle(
              color: theme.primaryColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Order History',
            style: TextStyle(
              color: theme.primaryColor,
              fontSize: 14,
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.home),
              tileColor: Colors.white,
              iconColor: theme.primaryColor.withOpacity(.8),
              dense: true,
              minVerticalPadding: 0,
              minLeadingWidth: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              title: Text(
                'Orders',
                style: TextStyle(
                  color: theme.primaryColor,
                ),
              ),
              subtitle: Text(
                'You have 0 activw orders',
                style: TextStyle(
                  color: theme.primaryColor.withOpacity(.8),
                  fontSize: 13,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios_sharp),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Account Settings',
            style: TextStyle(
              color: theme.primaryColor,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 5),
          ProfileCard(
            onTap: () {},
            leadingIcon: Icons.add,
            text: 'Personal Details',
            isTop: true,
          ),
          ProfileCard(
            onTap: () {},
            leadingIcon: Icons.add,
            text: 'Peayment Cards',
          ),
          ProfileCard(
            onTap: () {},
            leadingIcon: Icons.add,
            text: 'Addresses',
            isbottom: true,
          ),
          const SizedBox(height: 20),
          Text(
            'Referrals & Credits',
            style: TextStyle(
              color: theme.primaryColor,
              fontSize: 14,
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.home),
              tileColor: Colors.white,
              iconColor: theme.primaryColor.withOpacity(.8),
              dense: true,
              minVerticalPadding: 0,
              minLeadingWidth: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              title: Text(
                'Invite Your Friends',
                style: TextStyle(
                  color: theme.primaryColor,
                ),
              ),
              subtitle: Text(
                'Get AED 20 on your next order',
                style: TextStyle(
                  color: theme.primaryColor.withOpacity(.8),
                  fontSize: 13,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 20,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Help Center',
            style: TextStyle(
              color: theme.primaryColor,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 5),
          ProfileCard(
            onTap: () {},
            text: 'Support',
            leadingIcon: Icons.add,
            isTop: true,
          ),
          ProfileCard(
            onTap: () {},
            text: 'Support',
            leadingIcon: Icons.add,
            isbottom: true,
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              textStyle: const TextStyle(
                // color: theme.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
              ),
            ),
            child: Text(
              'Log Out',
              style: TextStyle(color: theme.primaryColor),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Version 0.1.0 Build 1620376389',
            style: TextStyle(
              fontSize: 12,
              color: theme.primaryColor.withOpacity(.45),
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
    required this.text,
    required this.leadingIcon,
    required this.onTap,
    this.isTop = false,
    this.isbottom = false,
  }) : super(key: key);
  final String text;
  final IconData leadingIcon;
  final GestureTapCallback onTap;
  final bool isTop;
  final bool isbottom;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: isTop ? const Radius.circular(10) : Radius.zero,
          topRight: isTop ? const Radius.circular(10) : Radius.zero,
          bottomLeft: isbottom ? const Radius.circular(10) : Radius.zero,
          bottomRight: isbottom ? const Radius.circular(10) : Radius.zero,
        ),
      ),
      child: ListTile(
        onTap: onTap,
        tileColor: Colors.white,
        iconColor: theme.primaryColor.withOpacity(.9),
        textColor: theme.primaryColor,
        leading: Icon(leadingIcon),
        minLeadingWidth: 2,
        minVerticalPadding: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: .5,
            color: theme.primaryColor.withOpacity(.12),
          ),
          borderRadius: BorderRadius.only(
            topLeft: isTop ? const Radius.circular(10) : Radius.zero,
            topRight: isTop ? const Radius.circular(10) : Radius.zero,
            bottomLeft: isbottom ? const Radius.circular(10) : Radius.zero,
            bottomRight: isbottom ? const Radius.circular(10) : Radius.zero,
          ),
        ),
        title: Text(
          text,
          style: const TextStyle(fontSize: 15),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 20,
        ),
      ),
    );
  }
}
