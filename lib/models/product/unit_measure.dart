class MeasureModel {
  List<UnitsOfMeasureModel> unitsOfMeasure;

  MeasureModel({required this.unitsOfMeasure});

  factory MeasureModel.fromJson(Map<dynamic, dynamic> json) => MeasureModel(
      unitsOfMeasure: (json["unitsOfMeasure"] as List)
          .map((e) => UnitsOfMeasureModel.fromJson(e))
          .toList());
}

class UnitsOfMeasureModel {
  int id;
  String name;
  int companyUnitOfMeasureID;

  UnitsOfMeasureModel(
      {required this.id,
      required this.name,
      required this.companyUnitOfMeasureID});

  factory UnitsOfMeasureModel.fromJson(Map<dynamic, dynamic> json) =>
      UnitsOfMeasureModel(
          id: json["id"],
          name: json["name"],
          companyUnitOfMeasureID: json["companyUnitOfMeasureID"]);

  Map<dynamic, dynamic> toJson() => {"name": name};
}
