import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../widgets/category_bottomsheet.dart';
import '../widgets/support_dialog.dart';

class ReferralsScreen extends ConsumerStatefulWidget {
  const ReferralsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReferralsScreenState();
}

class _ReferralsScreenState extends ConsumerState<ReferralsScreen> {

  @override
  Widget build(BuildContext context) {
    final ThemeData theme =  Theme.of(context);
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
      ),);
  }
}