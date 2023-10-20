import 'package:ti_bank/custom_theme.dart';
import 'package:ti_bank/data/models/new.dart';
import 'package:ti_bank/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class NewsDetailedScreen extends StatelessWidget {
  const NewsDetailedScreen({
    super.key,
    required this.oneNew,
  });

  final New oneNew;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => context.pop(),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_back,
                        color: CustomTheme.blackColor,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'NEWS',
                        style: context.textTheme.displayMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Image.network(
                  oneNew.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
                const SizedBox(height: 12),
                Text(
                  oneNew.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: CustomTheme.blackColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  DateFormat('dd MMMM, yyyy').format(oneNew.dateTime),
                  style: context.textTheme.titleSmall,
                ),
                const SizedBox(height: 24),
                Text(
                  oneNew.text,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFF727272),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
