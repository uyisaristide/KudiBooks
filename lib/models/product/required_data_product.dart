class RequiredDataProduct {
  List<RevenueAccounts> revenueAccounts;
  List<InventoryExpenseAccounts> inventoryExpenseAccounts;
  List<UnitsOfMeasure> unitsOfMeasure;

  RequiredDataProduct(
      {required this.revenueAccounts,
      required this.inventoryExpenseAccounts,
      required this.unitsOfMeasure});

  factory RequiredDataProduct.fromJson(Map<dynamic, dynamic> json) =>
      RequiredDataProduct(
          revenueAccounts: (json["revenueAccounts"] as List)
              .map((e) => RevenueAccounts.fromJson(e))
              .toList(),
          inventoryExpenseAccounts: (json["inventoryExpenseAccounts"] as List)
              .map((e) => InventoryExpenseAccounts.fromJson(e))
              .toList(),
          unitsOfMeasure: (json["unitsOfMeasure"] as List)
              .map((e) => UnitsOfMeasure.fromJson(e))
              .toList());

  Map<String, dynamic> toJson() {
    return {
      "revenueAccounts": revenueAccounts.map((e) => e.toJson()).toList(),
      "inventoryExpenseAccounts":
          inventoryExpenseAccounts.map((e) => e.toJson()).toList(),
      "unitsOfMeasure": unitsOfMeasure.map((e) => e.toJson()).toList()
    };
  }
}

class UnitsOfMeasure {
  int id;
  String? name;

  UnitsOfMeasure({required this.id, this.name});

  factory UnitsOfMeasure.fromJson(Map<dynamic, dynamic> json) =>
      UnitsOfMeasure(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name};
  }
}

class InventoryExpenseAccounts {
  int id;
  String? name;

  InventoryExpenseAccounts({required this.id, this.name});

  factory InventoryExpenseAccounts.fromJson(Map<dynamic, dynamic> json) =>
      InventoryExpenseAccounts(id: json["id"], name: json["name"]);

  Map<dynamic, dynamic> toJson() {
    return {"id": id, "name": name};
  }
}

class RevenueAccounts {
  int id;
  String? name;

  RevenueAccounts({required this.id, this.name});

  factory RevenueAccounts.fromJson(Map<dynamic, dynamic> json) =>
      RevenueAccounts(id: json["id"], name: json["name"]);

  Map<dynamic, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
    };
  }
}
