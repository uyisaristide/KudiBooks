
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/expense_model.dart';

class ExpensesProvider extends StateNotifier<List<Expense>> {
  ExpensesProvider() : super([]);

  addExpense(Expense expense) {
    state = [...state, expense];
  }

  removeExpense(Expense expense) {
    state.removeWhere((element) => element.id == expense.id);
  }
}
