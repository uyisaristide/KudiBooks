class ProductModel {
  int id;
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
      {required this.id,
      this.revenueAccount,
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

  static List<ProductModel> generateList() => [];
}
