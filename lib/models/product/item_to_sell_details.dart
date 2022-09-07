class ItemToSellDetails {
  AccountSelectedDetails accountSelected;
  InventoryExpenseAccountSelectedDetails inventoryExpenseDetails;
  ProductSelectedDetails productSelectedDetails;
  SubUnitDetails subUnitDetails;

  ItemToSellDetails({
    required this.accountSelected,
    required this.inventoryExpenseDetails,
    required this.productSelectedDetails,
    required this.subUnitDetails
  });

  factory ItemToSellDetails.fromJson(Map<String, dynamic> json){
    return ItemToSellDetails(accountSelected: AccountSelectedDetails.fromJson(json["accountSelected"]),
        inventoryExpenseDetails: InventoryExpenseAccountSelectedDetails.fromJson(json["inventoryExpenseDetails"]),
        productSelectedDetails: ProductSelectedDetails.fromJson(json["productSelectedDetails"]),
        subUnitDetails: SubUnitDetails.fromJson(json["subUnitDetails"]));
  }
}

class SubUnitDetails {
  int? soldInSubUnits;
  String? subUnitName;
  double? subUnitPrice;
  SelectedUnitOfMeasure? selectedUnitOfMeasure;

  SubUnitDetails({this.soldInSubUnits,
    this.subUnitName,
    this.subUnitPrice,
    this.selectedUnitOfMeasure});

  factory SubUnitDetails.fromJson(Map<dynamic, dynamic> json) {
    return SubUnitDetails();
  }
}

class SelectedUnitOfMeasure {
  int id;
  int companyUnitOfMeasureID;
  String name;

  SelectedUnitOfMeasure({required this.id,
    required this.companyUnitOfMeasureID,
    required this.name});

  factory SelectedUnitOfMeasure.fromJson(Map<dynamic, dynamic> json) {
    return SelectedUnitOfMeasure(id: json["id"],
        companyUnitOfMeasureID: json["companyUnitOfMeasureID"],
        name: json["name"]);
  }
}

class ProductSelectedDetails {
  String name;
  int price;
  String description;
  bool isInventory;
  String note;

  ProductSelectedDetails({
    required this.name,
    required this.price,
    required this.description,
    required this.isInventory,
    required this.note});

  factory ProductSelectedDetails.fromJson(Map<dynamic, dynamic> json){
    return ProductSelectedDetails(
        name: json["name"],
        price: json["price"],
        description: json["description"],
        isInventory: json["isInventory"],
        note: json["note"]);
  }
}

class InventoryExpenseAccountSelectedDetails {
  int id;
  String name;

  InventoryExpenseAccountSelectedDetails({
    required this.id, required this.name
  });

  factory InventoryExpenseAccountSelectedDetails.fromJson(
      Map<dynamic, dynamic> json) =>
      InventoryExpenseAccountSelectedDetails(id: json["id"], name: json["name"]);
}

class AccountSelectedDetails {
  int id;
  String name;

  AccountSelectedDetails({required this.id, required this.name});

  factory AccountSelectedDetails.fromJson(Map<dynamic, dynamic> json){
    return AccountSelectedDetails(id: json["id"], name: json["name"]);
  }
}
