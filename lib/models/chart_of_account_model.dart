import 'dart:core';

class ChartAccountModel {
  int accountTypeSelected;
  String accountName;
  String? accountCode;
  String? note;
  int? expenseCategory;

  ChartAccountModel(
      {required this.accountTypeSelected,
      required this.accountName,
      this.accountCode,
      this.note,
      this.expenseCategory});

  factory ChartAccountModel.fromJson(Map<String, dynamic> json) =>
      ChartAccountModel(
          accountTypeSelected: json["accountTypeSelected"],
          accountName: json["accountName"],
          accountCode: json["accountCode"],
          note: json["accountNote"],
          expenseCategory: json["expenseCategory"]);

  Map<String, dynamic> toJson() {
    return {
      "accountTypeSelected": accountTypeSelected,
      "accountName": accountName,
      "accountCode": accountCode,
      "accountNote": note,
      "expenseCategory": expenseCategory,
    };
  }
}
