import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ti_bank/constants.dart';
import 'package:ti_bank/custom_theme.dart';
import 'package:ti_bank/data/incomes_change_notifier.dart';
import 'package:ti_bank/screens/news_screen/widgets/new_item.dart';
import 'package:ti_bank/utils/extensions.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.primaryColor,
      child: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Home',
                  style: context.textTheme.displayMedium,
                ),
              ),
            ),
            const SizedBox(height: 12),
            ListenableBuilder(
              listenable: context.read<IncomesChangeNotifier>(),
              builder: (context, child) {
                return Text(
                  '\$${context.read<IncomesChangeNotifier>().summ()}',
                  style: context.textTheme.displayLarge,
                );
              },
            ),
            const SizedBox(height: 12),
            const Text(
              '5213 5478 6545 0231',
              style: TextStyle(
                fontSize: 12,
                color: CustomTheme.blackColor,
              ),
            ),
            const SizedBox(height: 48),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: CustomTheme.whiteColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'News',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                            color: CustomTheme.blackColor,
                          ),
                        ),
                        Text(
                          'View all',
                          style: context.textTheme.titleSmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            NewItem(oneNew: Constants.news.first),
                            NewItem(oneNew: Constants.news[1]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
