import 'dart:core';

class ChartAccountModel {
  int accountTypeSelected;
  String accountName;
  String? accountCode;
  String? accountNote;
  int? expenseCategory;

  ChartAccountModel(
      {required this.accountTypeSelected,
      required this.accountName,
      this.accountCode,
      this.accountNote,
      this.expenseCategory});

  factory ChartAccountModel.fromJson(Map<String, dynamic> json) =>
      ChartAccountModel(
          accountTypeSelected: json["accountTypeSelected"],
          accountName: json["accountName"],
          accountCode: json["accountCode"],
          accountNote: json["accountNote"],
          expenseCategory: json["expenseCategory"]);

  Map<String, dynamic> toJson() {
    return {
      "accountTypeSelected": accountTypeSelected,
      "accountName": accountName,
      "accountCode": accountCode,
      "accountNote": accountCode,
      "expenseCategory": expenseCategory,
    };
  }
}
