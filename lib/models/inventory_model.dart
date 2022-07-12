class InventoryModel {
  final String bulkName;
  final List<int>? productList;
  final double? amountPaid;
  final String? bankAccount;
  final double? deptAmount;
  final String? vendor;
  final String? transactionName;
  final String? transactionDate;
  final String? memoInventory;

  InventoryModel(
      this.bulkName,
      this.productList,
      this.amountPaid,
      this.bankAccount,
      this.deptAmount,
      this.vendor,
      this.transactionName,
      this.transactionDate,
      this.memoInventory);
}
