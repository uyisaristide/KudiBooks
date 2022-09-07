class AccountDetailsModel {
  AccountSelected accountSelected;
  AccountDetails accountDetails;

  AccountDetailsModel(
      {required this.accountSelected, required this.accountDetails});

  factory AccountDetailsModel.fromJson(Map<String, dynamic> json) {
    return AccountDetailsModel(
        accountSelected: AccountSelected.fromJson(json['accountSelected']),
        accountDetails: AccountDetails.fromJson(json['accountDetails']));
  }
}

class AccountSelected {
  int code;
  String name;
  int type;

  AccountSelected({required this.code, required this.name, required this.type});

  factory AccountSelected.fromJson(Map<String, dynamic> json) => AccountSelected( code: json['code'], name: json['name'], type: json['type']);
}

class AccountDetails {
  String ?name;
  String? code;
  String? note;
  int? expenseCategory;

  AccountDetails(
      {required this.name,
      required this.code,
      required this.note,
      this.expenseCategory});

  factory AccountDetails.fromJson(Map<String, dynamic> json) => AccountDetails(
      name: json['name'],
      code: json['code'],
      note: json['note'],
      expenseCategory: json['expenseCategory']);
}
