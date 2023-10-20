import 'package:ti_bank/screens/home_page/widgets/bottom_bar_item.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.currentIndex,
    required this.onItemTap,
  });

  final int currentIndex;
  final void Function(int) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
        top: 8,
      ),
      child: Row(
        children: [
          BottomBarItem(
            onTap: () => onItemTap(0),
            activeIconPath: 'assets/bot/active_home.svg',
            inactiveIconPath: 'assets/bot/nonactive_home.svg',
            active: currentIndex == 0,
            title: 'Home',
          ),
          BottomBarItem(
            onTap: () => onItemTap(1),
            activeIconPath: 'assets/bot/active_income.svg',
            inactiveIconPath: 'assets/bot/nonactive_income.svg',
            active: currentIndex == 1,
            title: 'Income',
          ),
          BottomBarItem(
            onTap: () => onItemTap(2),
            activeIconPath: 'assets/bot/active_paper.svg',
            inactiveIconPath: 'assets/bot/nonactive_paper.svg',
            active: currentIndex == 2,
            title: 'News',
          ),
          BottomBarItem(
            onTap: () => onItemTap(3),
            activeIconPath: 'assets/bot/active_gear.svg',
            inactiveIconPath: 'assets/bot/nonactive_gear.svg',
            active: currentIndex == 3,
            title: 'Settings',
          ),
        ],
      ),
    );
  }
}
