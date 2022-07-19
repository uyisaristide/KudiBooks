class Expense {
  int id;
  String expenseAccount;
  double amountPaid;
  double amountOnMethod;
  String accountCash;
  String transactionName;
  String transactionDate;
  String? memoExpense;

  Expense(
      this.id,
      this.expenseAccount,
      this.amountPaid,
      this.amountOnMethod,
      this.accountCash,
      this.transactionName,
      this.transactionDate,
      this.memoExpense);
}
