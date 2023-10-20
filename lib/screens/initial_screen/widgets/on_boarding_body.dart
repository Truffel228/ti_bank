import 'package:ti_bank/glob_widgets/app_button.dart';
import 'package:ti_bank/utils/extensions.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({
    super.key,
    required this.centerWidget,
    required this.title,
    required this.subTitle,
    required this.onTap,
    required this.pageIndex,
  });

  final Widget centerWidget;
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex: 13,
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.symmetric(horizontal: 16)
                    .copyWith(bottom: 20),
                color: context.theme.primaryColor,
                child: centerWidget,
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const Spacer(),
                    Text(
                      title,
                      style: context.textTheme.displayLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      subTitle,
                      style: context.textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AppButton(
                        title: 'Continue',
                        onTap: onTap,
                      ),
                    ),
                    const Spacer(),
                    const TermsAndPolicy(),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: const Alignment(0, -0.85),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: RicePageIndicator(
              currentIndex: pageIndex,
            ),
          ),
        ),
      ],
    );
  }
}
