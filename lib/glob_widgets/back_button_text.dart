import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ti_bank/custom_theme.dart';
import 'package:ti_bank/utils/extensions.dart';

class BackButtonText extends StatelessWidget {
  const BackButtonText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pop(),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.chevron_left,
            size: 24,
            color: CustomTheme.fontGreyColor,
          ),
          const SizedBox(width: 24),
          Text(
            title,
            style: context.textTheme.displayLarge,
          ),
        ],
      ),
    );
  }
}
