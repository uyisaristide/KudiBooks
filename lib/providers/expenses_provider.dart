import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kudibooks_app/models/expense_model.dart';

final expenseProvider = StateNotifierProvider<ExpensesProvider, List<Expense>>(
    (ref) => ExpensesProvider());

class ExpensesProvider extends StateNotifier<List<Expense>> {
  ExpensesProvider() : super([]);

  addExpense(Expense expense) {
    state = [...state, expense];
  }

  removeExpense(Expense expense) {
    state.removeWhere((element) => element.id == expense.id);
  }
}
