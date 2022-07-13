import 'dart:core';

class PurchasePlan {
  int? id;
  String planType;
  double planPrice;
  String currency;
  String planPeriod;

  PurchasePlan(
      {this.id,
      required this.planType,
      required this.planPrice,
      required this.currency,
      required this.planPeriod});

  static List<PurchasePlan> purchaseList() {
    return [
      PurchasePlan(
          planType: "Basic",
          planPrice: 5000.0,
          currency: "Rwf",
          planPeriod: "Per month"),
      PurchasePlan(
          planType: "Plus",
          planPrice: 9000.0,
          currency: "Rwf",
          planPeriod: "Per month"),
      PurchasePlan(
          planType: "Premium",
          planPrice: 29000.0,
          currency: "Rwf",
          planPeriod: "Per month"),
    ];
  }
}
