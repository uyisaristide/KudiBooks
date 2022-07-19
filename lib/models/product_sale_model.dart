class ProductSalesModel {
  final int saleId;
  final String transactionDate;
  final String transactionName;
  final String productSold;
  final double amountPaid;
  final String paymentMethod;
  final double debtAmount;
  final String client;

  ProductSalesModel(
      this.saleId,
      this.transactionDate,
      this.transactionName,
      this.productSold,
      this.amountPaid,
      this.paymentMethod,
      this.debtAmount,
      this.client);

  static List<ProductSalesModel> generateSales() => [];
}
