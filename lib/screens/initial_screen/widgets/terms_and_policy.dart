import 'package:ti_bank/utils/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsAndPolicy extends StatelessWidget {
  const TermsAndPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Terms of use  ',
        style: context.textTheme.titleSmall,
        recognizer: TapGestureRecognizer()..onTap = _onTermsTap,
        children: [
          const TextSpan(text: '|'),
          TextSpan(
            text: '  Privacy policy',
            recognizer: TapGestureRecognizer()..onTap = _onPolicyTap,
          ),
        ],
      ),
    );
  }

  void _onTermsTap() {}

  void _onPolicyTap() {}
}
