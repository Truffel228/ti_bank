import 'package:ti_bank/screens/home_page/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.child});
  final StatefulNavigationShell child;

  void _onBottomBarItemTap(int index) => child.goBranch(index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomBar(
        onItemTap: _onBottomBarItemTap,
        currentIndex: child.currentIndex,
      ),
    );
  }
}
