

import 'package:hive/hive.dart';

part 'company_model.g.dart';
// CompanyModel companyModelFromJson(String str) => CompanyModel.fromJson(json.decode(str));

// String companyModelToJson(CompanyModel data) => json.encode(data.toJson());
@HiveType(typeId: 3)
class CompanyModel {
  CompanyModel({
    required this.companyId,
    required this.companyName,
    required this.website,
    required this.amIAdmin,
    required this.suspendedByKudiBooks,
    required this.suspendedByAdmin,
    required this.industry,
  });
@HiveField(0)
  int companyId;

  @HiveField(1)
  String companyName;

  @HiveField(2)
  dynamic website;

  @HiveField(3)
  int amIAdmin;

  @HiveField(4)
  int suspendedByKudiBooks;

  @HiveField(5)
  int suspendedByAdmin;

  @HiveField(6)
  String industry;

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        companyId: json["companyID"],
        companyName: json["companyName"],
        website: json["website"],
        amIAdmin: json["amIAdmin"],
        suspendedByKudiBooks: json["suspendedByKudiBooks"],
        suspendedByAdmin: json["suspendedByAdmin"],
        industry: json["industry"],
      );

  Map<String, dynamic> toJson() => {
        "companyID": companyId,
        "companyName": companyName,
        "website": website,
        "amIAdmin": amIAdmin,
        "suspendedByKudiBooks": suspendedByKudiBooks,
        "suspendedByAdmin": suspendedByAdmin,
        "industry": industry,
      };
}

class CompaniesList {
  List<CompanyModel> companies;

  CompaniesList({required this.companies});

  factory CompaniesList.fromJson(Map<dynamic, dynamic> json) => CompaniesList(
      companies: (json["companies"] as List)
          .map((e) => CompanyModel.fromJson(e))
          .toList());

// Map<String, dynamic> toJson() {
//     "companies":companies.map((v) => v.toJson()).toList();
// }
}









// class Company {
//   String companyName;
//   int industry;
//   int country;
//   int currency;
//   int plan;

//   Company(
//       {required this.companyName,
//       required this.industry,
//       required this.country,
//       required this.currency,
//       required this.plan});

//   factory Company.fromJson(Map<dynamic, dynamic> fromJson) {
//     return Company(
//         companyName: fromJson['companyName '],
//         industry: fromJson['industry'],
//         country: fromJson['country'],
//         currency: fromJson['currency'],
//         plan: fromJson['plan']);
//   }

//   Map<dynamic, dynamic> toJson() {
//     return {
//       "companyName": companyName,
//       "industry": industry,
//       "country": country,
//       "currency": currency,
//       "plan": plan,
//     };
//   }
// }
