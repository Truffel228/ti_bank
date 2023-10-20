import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ti_bank/constants.dart';
import 'package:ti_bank/data/models/income.dart';

class IncomesChangeNotifier extends ChangeNotifier {
  IncomesChangeNotifier(this._shPrefs);
  final SharedPreferences _shPrefs;

  final List<Income> _incomes = [];

  List<Income> incomes(IncomeSource source) => _incomes
      .where(
        (element) => element.source == source,
      )
      .toList();

  void addIncome(Income income) {
    _incomes.add(income);
    _cacheIncomes();
    notifyListeners();
  }

  void removeIncome(int index) {
    _incomes.removeAt(index);
    _cacheIncomes();
    notifyListeners();
  }

  void editIncome(int index, Income edittedIncome) {
    _incomes.removeAt(index);
    _incomes.insert(index, edittedIncome);
    _cacheIncomes();
    notifyListeners();
  }

  void init() {
    final encodedJsons = _shPrefs.getString(Constants.cachedIncomesKey);

    if (encodedJsons == null) return;

    final decodedJsons = jsonDecode(encodedJsons) as List<dynamic>;

    final cachedIncomes = decodedJsons.map((e) => Income.fromJson(e)).toList();
    _incomes.addAll(cachedIncomes);
    notifyListeners();
  }

  void _cacheIncomes() {
    final jsons = _incomes.map((e) => e.toJson()).toList();
    final encodedJsons = jsonEncode(jsons);
    _shPrefs.setString(Constants.cachedIncomesKey, encodedJsons);
  }

  int summ([IncomeSource? source]) {
    if (source == null) {
      int amount = 0;
      for (var income in _incomes) {
        amount += income.amount;
      }
      return amount;
    }

    final specificIncomesList =
        _incomes.where((element) => element.source == source).toList();

    int amount = 0;
    for (var income in specificIncomesList) {
      amount += income.amount;
    }
    return amount;
  }
}
