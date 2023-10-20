import 'package:ti_bank/custom_theme.dart';
import 'package:ti_bank/data/incomes_change_notifier.dart';
import 'package:ti_bank/utils/extensions.dart';
import 'package:flutter/material.dart';

class IncomeOptionsBottomSheet extends StatelessWidget {
  const IncomeOptionsBottomSheet({
    super.key,
    required this.incomeIndex,
    required this.incomesChangeNotifier,
    required this.onEditTap,
    required this.onDeleteTap,
    required this.onCancelTap,
  });

  final int incomeIndex;
  final IncomesChangeNotifier incomesChangeNotifier;
  final VoidCallback onEditTap;
  final VoidCallback onDeleteTap;
  final VoidCallback onCancelTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _Button(
          onTap: onEditTap,
          title: 'Редактировать',
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Divider(
            height: 0,
            color: Colors.black,
          ),
        ),
        _Button(
          onTap: onDeleteTap,
          title: 'Удалить',
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Divider(
            height: 0,
            color: Colors.black,
          ),
        ),
        _Button(
          onTap: onCancelTap,
          title: 'Назад',
        ),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.onTap,
    required this.title,
  });

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: CustomTheme.greyColor,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Text(
          title,
          style: context.textTheme.labelSmall,
        ),
      ),
    );
  }
}
