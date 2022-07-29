
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kudibooks_app/models/expense_model.dart';

class ExpensesProvider extends StateNotifier<List<Expense>> {
  ExpensesProvider() : super([]);

  addExpense(Expense expense) {
    state = [...state, expense];
  }

  removeExpense(Expense currentExpense) {
    state = state.where((expense) => expense.id != currentExpense.id).toList();
  }
}
