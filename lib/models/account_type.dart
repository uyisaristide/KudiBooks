class AccountChartModel {
  String accountCategory;
  List<AccountName> accountName;
  int accountType;
  List<ExpenseCategory> expenseCategories;

  AccountChartModel(
      {required this.accountCategory,
      required this.accountName,
      required this.accountType,
      required this.expenseCategories});

  factory AccountChartModel.fromJson(Map<dynamic, dynamic> json) =>
      AccountChartModel(
          accountCategory: json["accountCategory"],
          accountName: (json["accountName"] as List).map((e) => AccountName.fromJson(e)).toList(),
          accountType: json["accountType"],
          expenseCategories: (json["expenseCategories"] as List).map((e) => ExpenseCategory.fromJson(e)).toList());

  Map<dynamic, dynamic> toJson() {
    return {
      "accountCategory": accountCategory,
      "accountName": accountName,
      "accountType": accountType,
      "expenseCategories": expenseCategories
    };
  }
}

class AccountName {
  String name;
  int code;
  int type;

  AccountName({required this.name, required this.code, required this.type});

  factory AccountName.fromJson(Map<String, dynamic> json) =>
      AccountName(name: json["name"], code: json["code"], type: json["type"]);

  Map<String, dynamic> toJson() => {"name": name, "code": code, "type": type};
}

class ExpenseCategory {
  int id;
  String name;

  ExpenseCategory({required this.id, required this.name});

  factory ExpenseCategory.fromJson(Map<dynamic, dynamic> json) =>
      ExpenseCategory(id: json["id"], name: json["name"]);

  Map<dynamic, dynamic> toJson() {
    return {"name": name};
  }
}
