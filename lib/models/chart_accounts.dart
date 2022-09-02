class ChartAccount {
  List<Accounts> accounts;

  ChartAccount({required this.accounts});

  factory ChartAccount.fromJson(Map<dynamic, dynamic> json) => ChartAccount( accounts:
          (json["accounts"] as List).map((e) => Accounts.fromJson(e)).toList());

// Map<String, dynamic> toJson() {
//     "accounts":accounts.map((v) => v.toJson()).toList();
// }
}

class Accounts {
  int id;
  String accountType;
  String accountName;
  String? code;
  String totalDebit;
  String totalCredit;

  Accounts(
      {required this.id,
      required this.accountType,
      required this.accountName,
      required this.code,
      required this.totalDebit,
      required this.totalCredit});

  factory Accounts.fromJson(Map<String, dynamic> json) => Accounts(
      id: json['id'],
      accountType: json['accountType'],
      accountName: json['accountName'],
      code: json['code'],
      totalCredit: json["totalCredit"],
      totalDebit: json['totalDebit']);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "accountType": accountType,
      "accountName": accountName,
      "code": code,
      "totalCredit": totalCredit,
      "totalDebit": totalDebit,
    };
  }
}
