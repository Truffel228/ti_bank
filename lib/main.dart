import 'package:ti_bank/custom_theme.dart';
import 'package:ti_bank/data/incomes_change_notifier.dart';
import 'package:ti_bank/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );

  final shPrefs = await SharedPreferences.getInstance();

  runApp(MyApp(shPrefs));
}

class MyApp extends StatelessWidget {
  const MyApp(this._shPrefs, {super.key});

  final SharedPreferences _shPrefs;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: _shPrefs,
      child: ChangeNotifierProvider(
        create: (context) => IncomesChangeNotifier(_shPrefs)..init(),
        child: MaterialApp.router(
          title: 'Cards calculator',
          theme: CustomTheme.theme,
          routerConfig: Routes.routes,
        ),
      ),
    );
  }
}
