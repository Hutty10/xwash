import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/get_started_buttomsheet.dart';
import '../widgets/support_dialog.dart';

class GetStartedScreen extends ConsumerWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: size.width,
                height: size.height - 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/laundry2.jpg',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 250),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 300,
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 32,
                        width: 32,
                        child: Image.asset('assets/images/logo.jpg'),
                      ),
                      IconButton(
                        onPressed: () => showDialog(
                          context: context,
                          builder: (context) => const SupportDialog(),
                        ),
                        icon: Icon(
                          Icons.chat_outlined,
                          size: 32,
                          color: theme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'Laundry & Dry Cleaning',
                    style: TextStyle(
                      color: theme.primaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -1,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Lagos . Nigeria',
                    style: TextStyle(
                      color: theme.primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Serving more than 30,000 users in Nigeria',
                    style: TextStyle(
                      color: theme.primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      builder: (context) => const GetStartedBottomSheet(),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      fixedSize: Size(size.width, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    child: const Text('Let\'s get started'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
