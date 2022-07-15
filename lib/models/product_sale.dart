class ProductSale {
  final String transactionDate;
  final String transactionName;
  final String productSold;
  final double amountPaid;
  final String paymentMethod;
  final double debtAmount;
  final String client;

  ProductSale(
    this.transactionDate, 
    this.transactionName,
    this.productSold,
    this.amountPaid,
    this.paymentMethod,
    this.debtAmount,
    this.client);
}
