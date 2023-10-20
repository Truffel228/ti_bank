import 'package:flutter/material.dart';
import 'package:ti_bank/custom_theme.dart';

class ThreeDotsWidget extends StatelessWidget {
  const ThreeDotsWidget({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomTheme.blackColor,
              ),
              height: 4,
              width: 4,
            ),
            const SizedBox(height: 4),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomTheme.blackColor,
              ),
              height: 4,
              width: 4,
            ),
            const SizedBox(height: 4),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomTheme.blackColor,
              ),
              height: 4,
              width: 4,
            ),
          ],
        ),
      ),
    );
  }
}
