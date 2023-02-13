import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupLoginButton extends ConsumerWidget {
  const SignupLoginButton({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.color,
    required this.text,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final Color color;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        width: size.width - 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: 30,
                    color: Colors.white.withOpacity(.8),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    text,
                    style: TextStyle(
                        color: Colors.white.withOpacity(.8),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.2),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white.withOpacity(.8),
              ),
            )
          ],
        ),
      ),
    );
  }
}