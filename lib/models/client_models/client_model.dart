class ClientModel {
  int? id;
  String? clientName;
  bool? status;
  String? clientTin;
  String? contactPersonFirstName;
  String? contactPersonLastName;
  String? email;
  String? phoneNumber;
  String? physicalAddress;
  String? note;

  ClientModel({this.id,
    required this.clientName,
    required this.status,
    this.clientTin,
    this.contactPersonFirstName,
    this.contactPersonLastName,
    this.email,
    this.phoneNumber,
    this.physicalAddress,
    this.note});

  factory ClientModel.fromJson(Map<dynamic, dynamic> fromJson) {
    return ClientModel(
        id: fromJson["id"],
        clientName: fromJson["name"],
        status: fromJson["status"],
        clientTin: fromJson["Tin"],
        contactPersonFirstName: fromJson["contactPerson"],
        contactPersonLastName: fromJson["contactPersonL"],
        email: fromJson["email"],
        phoneNumber: fromJson["phoneNumber"],
        physicalAddress: fromJson["physicalAddress"],
        note: fromJson["note"]);
  }

  Map<dynamic, dynamic> clientToJson() {
    return {
      "clientName": clientName,
      "status": status,
      "clientTIN": clientTin,
      "contactPersonF": contactPersonFirstName,
      "contactPersonL": contactPersonLastName,
      "email": email,
      "phoneNumber": phoneNumber,
      "physicalAddress": physicalAddress,
      "note": note,
    };
  }
}