import 'package:flutter/material.dart';

class IconWithLabel extends StatelessWidget {
  const IconWithLabel({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            color: theme.primaryColor,
            size: 28,
          ),
          const SizedBox(height: 7),
          Text(
            text,
            style: TextStyle(
              color: theme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
