class AllVendor {
  List<VendorModel>? vendors;
  AllVendor({required this.vendors});
  factory AllVendor.fromJson(Map<String, dynamic> json)=>AllVendor(vendors: (json["vendors"] as List).map((e) => VendorModel.fromJson(e)).toList());
}

class VendorModel {
  int? id;
  String? vendorName;
  bool? status;
  String? vendorTIN;
  String? contactPersonFirstName;
  String? contactPersonLastName;
  String? email;
  String? phoneNumber;
  String? physicalAddress;
  String? note;

  VendorModel(
      {this.id,
      required this.vendorName,
      required this.status,
      this.vendorTIN,
      this.contactPersonFirstName,
      this.contactPersonLastName,
      this.email,
      this.phoneNumber,
      this.physicalAddress,
      this.note});

  factory VendorModel.fromJson(Map<dynamic, dynamic> fromJson) {
    return VendorModel(
        id: fromJson["id"],
        vendorName: fromJson["name"],
        status: fromJson["status"],
        vendorTIN: fromJson["vendorTIN"],
        contactPersonFirstName: fromJson["contactPerson"],
        contactPersonLastName: fromJson["contactPersonL"],
        email: fromJson["email"],
        phoneNumber: fromJson["phoneNumber"],
        physicalAddress: fromJson["physicalAddress"],
        note: fromJson["note"]);
  }

  Map<dynamic, dynamic> vendorToJson() {
    return {
      "vendorName": vendorName,
      "status": status,
      "vendorTin": vendorTIN,
      "contactPersonF": contactPersonFirstName,
      "contactPersonL": contactPersonLastName,
      "email": email,
      "phoneNumber": phoneNumber,
      "physicalAddress": physicalAddress,
    };
  }
}
