import 'package:flutter/material.dart';

class TextFieldWithLabel extends StatelessWidget {
  const TextFieldWithLabel({
    super.key,
    this.controller,
    required this.label,
    this.suffix,
    this.readOnly = false,
    this.validator,
    this.initialValue,
    this.hintText,
    this.keyboardType,
  });

  final TextEditingController? controller;
  final String label;
  final Widget? suffix;
  final bool readOnly;
  final String? Function(String? value)? validator;
  final String? initialValue;
  final String? hintText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: theme.primaryColor, fontSize: 15),
        ),
        SizedBox(
          height: 42,
          child: TextFormField(
            controller: controller,
            readOnly: readOnly,
            validator: validator,
            initialValue: initialValue,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText,
              suffix: suffix,
              border: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: theme.primaryColor.withOpacity(.1)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: theme.primaryColor.withOpacity(.4)),
              ),
              errorBorder: const UnderlineInputBorder(),
              focusedErrorBorder: const UnderlineInputBorder(),
              hintStyle: TextStyle(color: theme.primaryColor.withOpacity(.4)),
            ),
          ),
        ),
        const SizedBox(height: 15)
      ],
    );
  }
}
