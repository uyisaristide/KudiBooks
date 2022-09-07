class ProductSellModel {
  int revenueAccountSelected;
  int? inventoryAccountSelected;
  String productName;
  int productPrice;
  bool soldInSubUnits;
  bool isInventory;
  String? productDesc;
  String? productNote;
  int? companyUnitOfMeasureID;
  String? unitName;
  int? units;
  int? unitPrice;

  ProductSellModel(
      {required this.revenueAccountSelected,
      this.inventoryAccountSelected,
      required this.productName,
      required this.productPrice,
      required this.soldInSubUnits,
      required this.isInventory,
      this.productDesc,
      this.productNote,
      this.companyUnitOfMeasureID,
      this.unitName,
      this.units,
      this.unitPrice});

  factory ProductSellModel.fromJson(Map<dynamic, dynamic> json) =>
      ProductSellModel(
          revenueAccountSelected: json['revenueAccountSelected'],
          productName: json['productName'],
          productPrice: json['productPrice'],
          soldInSubUnits: json['soldInSubUnits'],
          isInventory: json['isInventory'],
          unitPrice: json['unitPrice'],
          productNote: json['productNote'],
          inventoryAccountSelected: json['inventoryAccountSelected'],
          companyUnitOfMeasureID: json['companyUnitOfMeasureID'],
          productDesc: json["productDesc"],
          unitName: json["unitName"],
          units: json["companyUnitOfMeasureID"]);

  Map<String, dynamic> toJson() {
    return {
      'revenueAccountSelected': revenueAccountSelected,
      'productName': productName,
      'productPrice': productPrice,
      'soldInSubUnits': soldInSubUnits,
      'isInventory': isInventory,
      'unitPrice': unitPrice,
      'productNote': productNote,
      'inventoryAccountSelected': inventoryAccountSelected,
      'companyUnitOfMeasureID': companyUnitOfMeasureID,
      'productDesc': productDesc,
      'unitName': unitName,
      'units': units
    };
  }
  Map<String, dynamic> toJsonNotInventory() {
    return {
      'revenueAccountSelected': revenueAccountSelected,
      'productName': productName,
      'productPrice': productPrice,
      'soldInSubUnits': soldInSubUnits,
      'isInventory': isInventory,
      'productNote': productNote,
      'inventoryAccountSelected': inventoryAccountSelected,
      'productDesc': productDesc,
    };
  }
}
