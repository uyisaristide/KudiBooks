class ProductModel {
  int? id;
  String? revenueAccount;
  String? inventoryExpenseAccount;
  String productName;
  String? subUnit;
  String? numberOfSubUnits;
  String? subUnitPrice;
  String? subUnitName;
  String? defaultSellingMethod;
  String? productPrice;
  String? productDescription;
  String? productNote;

  ProductModel(
      {this.revenueAccount,
      this.inventoryExpenseAccount,
      required this.productName,
      this.subUnit,
      this.numberOfSubUnits,
      this.subUnitPrice,
      this.subUnitName,
      this.defaultSellingMethod,
      this.productPrice,
      this.productDescription,
      this.productNote});

  static List<ProductModel> generateList() => [
        ProductModel(
            inventoryExpenseAccount: null,
            revenueAccount: "Account 4",
            productName: "Default")
      ];
}
