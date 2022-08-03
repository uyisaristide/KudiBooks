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
      {required this.saleId,
      required this.transactionDate,
      required this.transactionName,
      required this.productSold,
      required this.amountPaid,
      required this.paymentMethod,
      required this.debtAmount,
      required this.client});

  static List<ProductSalesModel> generateSales() => [];
}
