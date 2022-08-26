class AllClients {
  List<Clients>? clients;
  AllClients({required this.clients});
  factory AllClients.fromJson(Map<String, dynamic> json)=>AllClients(clients: (json["clients"] as List).map((e) => Clients.fromJson(e)).toList());
}

class Clients {
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

  Clients(
      {this.id,
        required this.clientName,
        required this.status,
        this.clientTin,
        this.contactPersonFirstName,
        this.contactPersonLastName,
        this.email,
        this.phoneNumber,
        this.physicalAddress,
        this.note});

  factory Clients.fromJson(Map<dynamic, dynamic> fromJson) {
    return Clients(
        id: fromJson["id"],
        clientName: fromJson["name"],
        status: fromJson["status"],
        clientTin: fromJson["number"],
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
    };
  }
}