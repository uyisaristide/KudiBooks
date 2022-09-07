import 'dart:convert';

CompanyRequiredData companyRequiredDataFromJson(String str) =>
    CompanyRequiredData.fromJson(json.decode(str));

String companyRequiredDataToJson(CompanyRequiredData data) =>
    json.encode(data.toJson());

class CompanyRequiredData {
  CompanyRequiredData({
    required this.countries,
    required this.currencies,
    required this.industries,
    required this.plans,
  });

  List<Country> countries;
  List<Country> currencies;
  List<Country> industries;
  List<Plan> plans;

  factory CompanyRequiredData.fromJson(Map<String, dynamic> json) =>
      CompanyRequiredData(
        countries: List<Country>.from(
            json["countries"].map((x) => Country.fromJson(x))),
        currencies: List<Country>.from(
            json["currencies"].map((x) => Country.fromJson(x))),
        industries: List<Country>.from(
            json["industries"].map((x) => Country.fromJson(x))),
        plans: List<Plan>.from(json["plans"].map((x) => Plan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
        "currencies": List<dynamic>.from(currencies.map((x) => x.toJson())),
        "industries": List<dynamic>.from(industries.map((x) => x.toJson())),
        "plans": List<dynamic>.from(plans.map((x) => x.toJson())),
      };
}

class Country {
  Country({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Plan {
  Plan({
    required this.id,
    required this.name,
    required this.description,
  });

  int id;
  String name;
  String description;

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}
