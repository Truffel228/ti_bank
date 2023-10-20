import 'package:ti_bank/data/models/income.dart';
import 'package:ti_bank/glob_widgets/back_button_text.dart';
import 'package:ti_bank/utils/extensions.dart';
import 'package:flutter/material.dart';

class IncomesEmptyBody extends StatelessWidget {
  const IncomesEmptyBody({
    super.key,
    required this.onAddIncomeTap,
    required this.source,
  });

  final VoidCallback onAddIncomeTap;
  final IncomeSource source;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: BackButtonText(title: source.title),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/box.png',
                height: 160,
                width: 160,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 12),
              Text(
                'No information on income yet',
                style: context.textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Click on the "Add income" button',
                style: context.textTheme.titleMedium,
                textAlign: TextAlign.center,
              )
            ],
          ),
          const SizedBox.shrink(),
        ],
      ),
    );
  }
}
