import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/vendor_model.dart';
class VendorListItem extends ConsumerWidget {
  VendorModel vendor;
  VendorListItem({Key? key, required this.vendor}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.only(
                left: 20, right: 20.0, top: 9, bottom: 9),
            decoration: BoxDecoration(
                color: const Color(0xffE6FDE6),
                borderRadius: BorderRadius.circular(20.0)),
            child: const Text(
              "Active",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 9.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0)),
            child: const Text(
              "\$25.99",
              style: TextStyle(fontSize: 15.0),
            ),
          ),
        ],
      ),
      leading: const CircleAvatar(
        radius: 25,
        child: Icon(Icons.person),
      ),
      subtitle: Text("${vendor.email}"),
      title: Text(
        "${vendor.vendorName}",
        style: const TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
