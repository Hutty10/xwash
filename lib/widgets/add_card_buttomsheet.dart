import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/db_services.dart';
import 'form_fields.dart';

class AddCardBottomSheet extends ConsumerStatefulWidget {
  const AddCardBottomSheet({
    super.key,
  });

  @override
  ConsumerState<AddCardBottomSheet> createState() => _AddCardBottomSheetState();
}

class _AddCardBottomSheetState extends ConsumerState<AddCardBottomSheet> {
  late TextEditingController _cardNumController, _expController, _cvvController;
  @override
  void initState() {
    _cardNumController = TextEditingController();
    _expController = TextEditingController();
    _cvvController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _cardNumController.dispose();
    _expController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(width: 35),
              Expanded(
                child: Text(
                  'Add Card',
                  style: TextStyle(
                    color: theme.primaryColor,
                    fontSize: 18,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                TextFieldWithLabel(
                  label: 'Card Number',
                  controller: _cardNumController,
                  hintText: '0000 0000 0000 0000',
                  keyboardType: TextInputType.number,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: TextFieldWithLabel(
                        label: 'Expiration',
                        controller: _expController,
                        hintText: 'MM/YY',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Flexible(
                      flex: 1,
                      child: TextFieldWithLabel(
                        label: 'cvv',
                        controller: _cvvController,
                        hintText: '123',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'An authorization of NGN 3.67 might be charged on your card, to confifm it is working. Thia amount is immediately refounded and not captured by xWash',
                  style: TextStyle(
                    color: theme.primaryColor,
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
          Divider(
            color: theme.primaryColor.withOpacity(.25),
            thickness: .9,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                ref.read(
                  insertCardProvider(
                    {
                      'type': 'mastercard',
                      'num': _cardNumController.text.trim(),
                      'cvv': _cvvController.text.trim(),
                      'exp': _expController.text.trim(),
                    },
                  ),
                );
                log('working');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.primaryColor,
                fixedSize: Size(MediaQuery.of(context).size.width, 45),
              ),
              child: const Text('Add'),
            ),
          ),
          // const SizedBox(height: 0)
        ],
      ),
    );
  }

  Text label(ThemeData theme, String text) {
    return Text(
      text,
      style: TextStyle(
        color: theme.primaryColor,
      ),
    );
  }
}
