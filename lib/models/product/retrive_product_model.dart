class ProductList {
  List<RetrieveProductModel>? items;

  ProductList({this.items});

  factory ProductList.fromJson(Map<dynamic, dynamic> json) => ProductList(
      items: (json["items"] as List)
          .map((e) => RetrieveProductModel.fromJson(e))
          .toList());
}

class RetrieveProductModel {
  int id;
  String accountName;
  String name;
  String price;
  String description;
  String note;

  RetrieveProductModel(
      {required this.id,
      required this.accountName,
      required this.name,
      required this.price,
      required this.description,
      required this.note});

  factory RetrieveProductModel.fromJson(Map<dynamic, dynamic> json) =>
      RetrieveProductModel(
          id: json["id"],
          accountName: json["accountName"],
          name: json["name"],
          price: json["price"],
          description: json["description"],
          note: json["note"]);
}
