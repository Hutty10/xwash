import 'dart:developer';

import 'package:flutter/material.dart';

class PaymentCard extends StatelessWidget {
  final String cardCvv;
  final String cardHolder;
  final String cardNumber;
  final String expiryDate;
  final String cardType;
  final Color cardColor;
  final GestureTapCallback onTap;

  const PaymentCard({
    Key? key,
    required this.cardCvv,
    required this.cardHolder,
    required this.cardNumber,
    required this.cardType,
    required this.onTap,
    required this.expiryDate,
    required this.cardColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      onLongPress: () {
        log('message');
      },
      child: Container(
        height: 162,
        width: 324,
        padding:
            const EdgeInsets.only(top: 17, bottom: 15, left: 26, right: 38),
        decoration: BoxDecoration(
          // color: cardColor,
          borderRadius: BorderRadius.circular(7),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [theme.primaryColor, theme.primaryColor.withOpacity(.5)],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cardType,
              style: theme.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 260,
              child: FittedBox(
                child: Text(
                  cardNumber,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 99,
                  height: 15,
                  child: Text(
                    cardHolder,
                    style: theme.textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                expCvv('EXP', expiryDate),
                expCvv('CVV', cardCvv),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Builder expCvv(String title, String subtitle) {
    return Builder(builder: (context) {
      final TextTheme textTheme = Theme.of(context).textTheme;
      return Column(
        children: [
          Text(
            title,
            style: textTheme.bodyMedium!.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: textTheme.titleSmall,
          )
        ],
      );
    });
  }
}
