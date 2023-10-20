import 'package:flutter_svg/flutter_svg.dart';
import 'package:ti_bank/custom_theme.dart';
import 'package:ti_bank/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ti_bank/utils/extensions.dart';

import 'widgets.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();

  void _onNextTap() => _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.decelerate,
      );

  void _onVeryLastPageTap() => context.goNamed(Routes.main);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              OnBoardingBody(
                centerWidget: Image.asset(
                  'assets/bank.png',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
                title:
                    'Manage your income, stay up to date, and control your finances - all in one app!',
                subTitle: '',
                onTap: _onNextTap,
                pageIndex: 0,
              ),
              OnBoardingBody(
                centerWidget: const _Card(),
                title: 'We value your feedback',
                subTitle:
                    'Every day we are getting better due to your ratings and reviews — that helps us protect your accounts.',
                onTap: _onVeryLastPageTap,
                pageIndex: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 4),
            color: CustomTheme.fontGreyColor,
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 40),
                  Text(
                    'Emily Walkers',
                    style: context.textTheme.displayMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/micro_star.svg',
                        height: 12,
                      ),
                      const SizedBox(width: 4),
                      SvgPicture.asset(
                        'assets/micro_star.svg',
                        height: 12,
                      ),
                      const SizedBox(width: 4),
                      SvgPicture.asset(
                        'assets/micro_star.svg',
                        height: 12,
                      ),
                      const SizedBox(width: 4),
                      SvgPicture.asset(
                        'assets/micro_star.svg',
                        height: 12,
                      ),
                      const SizedBox(width: 4),
                      SvgPicture.asset(
                        'assets/micro_star.svg',
                        height: 12,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "That's great to hear! It's always wonderful when a mobile app makes a positive impact on managing finances. Simplifying income tracking and offering easy ways to add income sources, set categories, and enter specific details can save time and make financial management much more efficient. Keep utilizing the app to stay on top of your finances with ease!",
                    style: context.textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                ],
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Transform.translate(
                    offset: const Offset(0, -25),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: CustomTheme.fontGreyColor,
                            offset: Offset(0, 3),
                            blurRadius: 10,
                          ),
                        ],
                        color: Color(0xFFe1e1e1),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/girl.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
