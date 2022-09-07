class ClientStatistics {
  int? all;
  int? active;
  int? inactive;
  int? local;
  int? imported;
  String? invoiced;
  String? currency;
  int? withoutInvoices;
  int? overPayers;
  int? invalidEmail;
  int? invalidPhone;

  ClientStatistics(
      {this.all,
      this.active,
      this.inactive,
      this.local,
      this.imported,
      this.invoiced,
      this.currency,
      this.withoutInvoices,
      this.overPayers,
      this.invalidEmail,
      this.invalidPhone});

  factory ClientStatistics.fromJson(Map<dynamic, dynamic> json) =>
      ClientStatistics(
        all: json["all"],
        active: json["active"],
        inactive: json["inactive"],
        local: json["local"],
        imported: json["imported"],
        invoiced: json["invoices"],
        currency: json["invoices"],
        withoutInvoices: json["withoutInvoices"],
        overPayers: json["overPayers"],
        invalidEmail: json["invalidEmail"],
        invalidPhone: json["invalidPhone"],
      );
}
