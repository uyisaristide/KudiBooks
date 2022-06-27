import 'package:flutter/material.dart';
import 'package:kudibooks_app/models/plan.dart';

class PlanCard extends StatelessWidget {
  PurchasePlan purchasePlan;

  PlanCard({required this.purchasePlan, Key? key}) : super(key: key);
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          border: Border.all(
              width: 1.0,
              color: isSelected ? Colors.grey : const Color(0xff157253)),
          // color: const Color(0xff157253),
          borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              purchasePlan.planType,
              style: const TextStyle(fontSize: 15),
            ),
            const Flexible(
              child: SizedBox(
                height: 10,
              ),
            ),
            Row(
              children: [
                Text(
                  purchasePlan.planPrice.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  purchasePlan.currency,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            const Flexible(
              child: SizedBox(
                height: 10,
              ),
            ),
            Text(
              purchasePlan.planPeriod,
              style: const TextStyle(fontSize: 15, color: Colors.grey),
            ),
            const Flexible(
              child: SizedBox(
                height: 50,
              ),
            ),
            const Text(
              "Feature ?",
              style: TextStyle(color: Color(0xff157253)),
            )
          ],
        ),
      ),
    );
    return RadioListTile(
      value: 1,
      groupValue: 1,
      onChanged: (int? value) {},
    );
  }
}
