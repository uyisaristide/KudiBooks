class Company {
  String companyName;
  int industry;
  int country;
  int currency;
  int plan;

  Company(
      {required this.companyName,
      required this.industry,
      required this.country,
      required this.currency,
      required this.plan});

  factory Company.fromJson(Map<dynamic, dynamic> fromJson) {
    return Company(
        companyName: fromJson['companyName '],
        industry: fromJson['industry'],
        country: fromJson['country'],
        currency: fromJson['currency'],
        plan: fromJson['plan']);
  }

  Map<dynamic, dynamic> toJson() {
    return {
      "companyName": companyName,
      "industry": industry,
      "country": country,
      "currency": currency,
      "plan": plan,
    };
  }
}
