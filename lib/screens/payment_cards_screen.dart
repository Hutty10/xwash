import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:xwash/widgets/add_card_buttomsheet.dart';
import 'package:xwash/widgets/card.dart';

import '../services/db_services.dart';
import '../widgets/category_bottomsheet.dart';
import '../widgets/support_dialog.dart';

class PaymentCardsScreen extends ConsumerWidget {
  const PaymentCardsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final getCard = ref.watch(getCardProvider);
    ref.read(getCardProvider);
    // print('object');
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
      ),
      body: ListView(
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          Text(
            'Payment Cards',
            style: TextStyle(
              color: theme.primaryColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '+ ',
                style: TextStyle(
                  color: theme.primaryColor,
                  fontSize: 18,
                ),
              ),
              GestureDetector(
                onTap: () => showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (_) => const AddCardBottomSheet()),
                child: Text(
                  'Add Card',
                  style: TextStyle(
                    color: theme.primaryColor,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          getCard.when(
            loading: () => const SizedBox.shrink(),
            data: (List<Map<String, dynamic>> data) {
              log('${data.length}');
              return ListView.separated(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return PaymentCard(
                    onTap: () {},
                    cardCvv: '121',
                    cardHolder: 'carsssssssssdHolder',
                    cardNumber: '0000 0000 0000 0000',
                    cardType: 'cardType',
                    expiryDate: 'expiryDate',
                    cardColor: Colors.black,
                  );
                },
                separatorBuilder: (_, __) {
                  log('error');
                  return const SizedBox(height: 20);
                },
              );
            },
            error: (Object error, StackTrace stackTrace) =>
                const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
