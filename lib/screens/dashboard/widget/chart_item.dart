import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../models/chart_accounts.dart';

class ChartItem extends ConsumerWidget {
  Accounts accounts;
  int index;

  ChartItem({Key? key, required this.accounts, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return ListTile(
      subtitle: Text(accounts.accountType),
      trailing: Column(
        children: [
          Text(
            "RWF: ${accounts.totalCredit}",
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          Text(
            "RWF: ${accounts.totalDebit}",
            style: const TextStyle(fontSize: 12, color: Colors.redAccent),
          ),
        ],
      ),
      title: Text(
        accounts.accountName,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
      leading: CircleAvatar(
        backgroundColor: const Color(0xffC4C4C4),
        child: Text(
          "${++index}",
          style: TextStyle(
              color:
                  index.isEven ? Colors.green.shade400 : Colors.amber.shade600,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ),
    );
  }
}
