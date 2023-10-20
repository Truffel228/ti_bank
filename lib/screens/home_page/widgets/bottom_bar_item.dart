import 'package:ti_bank/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem({
    super.key,
    required this.onTap,
    required this.activeIconPath,
    required this.inactiveIconPath,
    required this.active,
    required this.title,
  });

  final VoidCallback onTap;
  final String activeIconPath;
  final String inactiveIconPath;
  final bool active;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              active ? activeIconPath : inactiveIconPath,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color:
                    active ? CustomTheme.greyColor : CustomTheme.fontGreyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
