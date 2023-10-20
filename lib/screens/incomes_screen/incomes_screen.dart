import 'package:ti_bank/custom_theme.dart';
import 'package:ti_bank/data/incomes_change_notifier.dart';
import 'package:ti_bank/data/models/income.dart';
import 'package:ti_bank/glob_widgets/back_button_text.dart';
import 'package:ti_bank/routes.dart';
import 'package:ti_bank/screens/add_income_screen/add_income_screen.dart';
import 'package:ti_bank/screens/incomes_screen/widgets/income_options_bottom_sheet.dart';
import 'package:ti_bank/screens/incomes_screen/widgets/three_dots_widget.dart';
import 'package:ti_bank/screens/incomes_screen/widgets/widgets.dart';
import 'package:ti_bank/utils/extensions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class IncomesScreen extends StatefulWidget {
  const IncomesScreen({super.key, required this.source});
  final IncomeSource source;

  @override
  State<IncomesScreen> createState() => _IncomesScreenState();
}

class _IncomesScreenState extends State<IncomesScreen> {
  late final IncomesChangeNotifier _incomesChangeNotifier;
  List<Income> incomes = [];
  @override
  void initState() {
    super.initState();
    _incomesChangeNotifier = context.read<IncomesChangeNotifier>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: _onAddIncomeTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: context.theme.primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.add,
            color: CustomTheme.blackColor,
            size: 24,
          ),
        ),
      ),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: _incomesChangeNotifier,
          builder: (context, child) {
            incomes = _incomesChangeNotifier.incomes(widget.source);
            return ScrollConfiguration(
              behavior:
                  const MaterialScrollBehavior().copyWith(overscroll: false),
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: incomes.isEmpty
                    ? [
                        SliverFillRemaining(
                          child: IncomesEmptyBody(
                            source: widget.source,
                            onAddIncomeTap: _onAddIncomeTap,
                          ),
                        ),
                      ]
                    : [
                        SliverAppBar(
                          backgroundColor:
                              context.theme.scaffoldBackgroundColor,
                          leadingWidth: double.infinity,
                          leading: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: BackButtonText(
                              title: widget.source.title,
                            ),
                          ),
                          pinned: true,
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          sliver: SliverList.builder(
                            itemBuilder: (context, index) {
                              final income = incomes[index];

                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              '\$${income.amount.toString()}',
                                              style: context
                                                  .textTheme.labelSmall
                                                  ?.copyWith(
                                                      color: CustomTheme
                                                          .blackColor),
                                            ),
                                            if (income
                                                .description.isNotEmpty) ...[
                                              const SizedBox(height: 4),
                                              Text(
                                                income.description,
                                                style: context
                                                    .textTheme.titleSmall,
                                              ),
                                            ]
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () => _onIncomeOptionsTap(index),
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: ThreeDotsWidget(
                                          onTap: () =>
                                              _onIncomeOptionsTap(index),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  const Divider(
                                    color: CustomTheme.fontGreyColor,
                                  ),
                                ],
                              );
                            },
                            itemCount: incomes.length,
                          ),
                        ),
                      ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _onAddIncomeTap() async {
    final newIncome = await context.pushNamed<Income?>(
      Routes.addIncome,
      extra: AddIncomeScreenArgs(
        source: widget.source,
      ),
    );
    if (newIncome == null) return;
    _incomesChangeNotifier.addIncome(newIncome);
  }

  void _onIncomeOptionsTap(int incomeIndex) {
    showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      builder: (context) => IncomeOptionsBottomSheet(
        incomeIndex: incomeIndex,
        incomesChangeNotifier: _incomesChangeNotifier,
        onEditTap: () => _onEditTap(incomeIndex),
        onDeleteTap: () => _onDeleteTap(incomeIndex),
        onCancelTap: () => context.pop(),
      ),
    );
  }

  void _onEditTap(int incomeIndex) async {
    context.pop();
    final edittedIncome = await context.pushNamed<Income?>(
      Routes.addIncome,
      extra: AddIncomeScreenArgs(
        income: incomes[incomeIndex],
        source: widget.source,
      ),
    );
    if (edittedIncome == null) return;

    _incomesChangeNotifier.editIncome(incomeIndex, edittedIncome);
  }

  void _onDeleteTap(int incomeIndex) {
    _incomesChangeNotifier.removeIncome(incomeIndex);
    context.pop();
  }
}
