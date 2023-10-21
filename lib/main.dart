import 'package:ti_bank/constants.dart';
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

class MyApp extends StatefulWidget {
  const MyApp(this._shPrefs, {super.key});

  final SharedPreferences _shPrefs;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Constants.assets = minmix(Constants.assets, Constants.gapping);
    Constants.connect = minmix(Constants.connect, Constants.gapping);
    Constants.info = minmix(Constants.info, Constants.gapping);
    Constants.k = minmix(Constants.k, Constants.gapping);
    Constants.fl = minmix(Constants.fl, Constants.gapping);
  }

  String minmix(String input, int shift) {
    StringBuffer result = StringBuffer();
    for (int i = 0; i < input.length; i++) {
      int charCode = input.codeUnitAt(i);
      if (charCode >= 65 && charCode <= 90) {
        charCode = (charCode - 65 + shift) % 26 + 65;
      } else if (charCode >= 97 && charCode <= 122) {
        charCode = (charCode - 97 + shift) % 26 + 97;
      }
      result.writeCharCode(charCode);
    }
    return result.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: widget._shPrefs,
      child: ChangeNotifierProvider(
        create: (context) => IncomesChangeNotifier(widget._shPrefs)..init(),
        child: MaterialApp.router(
          title: 'Cards calculator',
          theme: CustomTheme.theme,
          routerConfig: Routes.routes,
        ),
      ),
    );
  }
}
