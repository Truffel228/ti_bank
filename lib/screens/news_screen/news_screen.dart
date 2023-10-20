import 'package:ti_bank/constants.dart';
import 'package:ti_bank/screens/news_screen/widgets/main_new_widget.dart';
import 'package:ti_bank/screens/news_screen/widgets/new_item.dart';
import 'package:ti_bank/utils/extensions.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'NEWS',
                style: context.textTheme.displayLarge,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const MainNewWidget(),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'ALL NEWS',
                style: context.textTheme.displayMedium,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: Constants.news.length,
                itemBuilder: (context, index) {
                  final oneNew = Constants.news[index];

                  return NewItem(oneNew: oneNew);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
