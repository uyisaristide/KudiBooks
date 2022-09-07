

class CreateCompanyModel {
    CreateCompanyModel({
        required this.companyName,
        required this.industry,
        required this.country,
        required this.currency,
        required this.plan,
    });

    String companyName;
    int? industry;
    int? country;
    int? currency;
    int? plan;

    factory CreateCompanyModel.fromJson(Map<String, dynamic> json) => CreateCompanyModel(
        companyName: json["companyName"],
        industry: json["industry"],
        country: json["country"],
        currency: json["currency"],
        plan: json["plan"],
    );

    Map<String, dynamic> toJson() => {
        "companyName": companyName,
        "industry": industry,
        "country": country,
        "currency": currency,
        "plan": plan,
    };
}
