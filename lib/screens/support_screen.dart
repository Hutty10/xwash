import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../services/support_service.dart';
import '../widgets/category_bottomsheet.dart';
import '../widgets/icon_label.dart';

class SupportScreen extends ConsumerWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
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
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
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
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          Text(
            'Support',
            style: TextStyle(
              color: theme.primaryColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.help,
                        color: Colors.deepPurple[300],
                        size: 30,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'FAQ',
                        style: TextStyle(
                            color: theme.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Our FAQ ia available on our website',
                    style: TextStyle(
                      color: theme.primaryColor,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Go to Website',
                      style: TextStyle(
                        color: theme.primaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.solidComments,
                        color: Colors.deepPurple[400],
                        // size: 30,
                      ),
                      const SizedBox(width: 15),
                      Text(
                        'Support',
                        style: TextStyle(
                          color: theme.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  RichText(
                    text: TextSpan(
                      text:
                          'XWash\'s support center is available to assist you everyday between ',
                      style: TextStyle(
                        color: theme.primaryColor,
                      ),
                      children: [
                        TextSpan(
                          text: '09:00 am - 10:30 pm',
                          style: TextStyle(
                            color: theme.primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'For any feedback, suggwstions or complaints please reach out to us on : ',
                    style: TextStyle(
                      color: theme.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () => ref.read(supportServiceProvider).launchEmail(),
                    child: Text(
                      'support@xwash.com',
                      style: TextStyle(
                        color: theme.primaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Divider(color: theme.primaryColor.withOpacity(.1)),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconWithLabel(
                        onTap: () =>
                            ref.read(supportServiceProvider).launchPhone(),
                        icon: Icons.call_outlined,
                        text: 'Call',
                      ),
                      IconWithLabel(
                        onTap: () =>
                            ref.read(supportServiceProvider).launchChat(),
                        icon: Icons.chat_outlined,
                        text: 'Chat',
                      ),
                      IconWithLabel(
                        onTap: () =>
                            ref.read(supportServiceProvider).launchEmail(),
                        icon: Icons.email_outlined,
                        text: 'Email',
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
