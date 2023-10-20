import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ti_bank/custom_theme.dart';
import 'package:ti_bank/data/incomes_change_notifier.dart';
import 'package:ti_bank/data/models/income.dart';
import 'package:ti_bank/routes.dart';
import 'package:ti_bank/utils/extensions.dart';

class IncomeTypesScreen extends StatelessWidget {
  const IncomeTypesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final incomesChangeNotifier = context.read<IncomesChangeNotifier>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListenableBuilder(
            listenable: context.read<IncomesChangeNotifier>(),
            builder: (context, child) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Income',
                      style: context.textTheme.displayLarge,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ...List.generate(
                    IncomeSource.values.length,
                    (index) {
                      final incomeSource = IncomeSource.values[index];

                      return GestureDetector(
                        onTap: () => context.pushNamed(
                          Routes.incomes,
                          extra: incomeSource,
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: CustomTheme.fontGreyColor),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                incomeSource.iconPath,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  incomeSource.title,
                                  style: context.textTheme.displayMedium,
                                ),
                              ),
                              Text(
                                '\$${incomesChangeNotifier.summ(incomeSource)}.00',
                                style: context.textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            }),
      ),
    );
  }
}
