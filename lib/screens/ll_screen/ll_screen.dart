import 'package:ti_bank/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class LLScreen extends StatelessWidget {
  const LLScreen({super.key, required this.u});
  final String u;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomTheme.whiteColor,
        iconTheme: const IconThemeData(color: CustomTheme.blackColor),
      ),
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(u),
          ),
        ),
      ),
    );
  }
}
