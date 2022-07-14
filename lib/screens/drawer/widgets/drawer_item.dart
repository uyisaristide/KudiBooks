import 'package:flutter/material.dart';

class DrawerListItem extends StatelessWidget {
  final IconData? leadingIcon;
  final String itemName;
  final Function navigateTo;
  const DrawerListItem({required this.itemName,required this.leadingIcon, required this.navigateTo,   Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  Icon(
        leadingIcon,
        size: 25,
      ),
      title:  Text(
        itemName,
        style: const TextStyle(fontSize: 17),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () => navigateTo,
    );
  }
}
