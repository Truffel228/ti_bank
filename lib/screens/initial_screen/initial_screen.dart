import 'package:ti_bank/constants.dart';
import 'package:ti_bank/routes.dart';
import 'package:ti_bank/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/widgets.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  late final SharedPreferences _sharedPreferences;
  bool _inited = false;

  @override
  void initState() {
    super.initState();
    _sharedPreferences = context.read<SharedPreferences>();
    _init();
  }

  Future<void> _init() async {
    final isOnBoardingShowed =
        _sharedPreferences.getBool(Constants.isOnBoardingShowedKey) ?? false;

    // if (!isOnBoardingShowed) {
      await _sharedPreferences.setBool(Constants.isOnBoardingShowedKey, true);
      setState(() {
        _inited = true;
      });
      return;
    // }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.goNamed(Routes.main);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _inited
          ? const OnBoarding()
          : ColoredBox(color: context.theme.primaryColor),
    );
  }
}
