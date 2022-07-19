import 'package:flutter/cupertino.dart';
import 'package:kudibooks_app/models/expense_model.dart';

class ExpensesProvider extends ChangeNotifier {
  List<Expense> expensesList = [];

  List<Expense> get allExpenses => expensesList;

  addExpense(Expense expense) {
    expensesList.add(expense);
    notifyListeners();
  }

  removeExpense(Expense expense) {
    expensesList.removeWhere((element) => element.id == expense.id);
    notifyListeners();
  }
}
