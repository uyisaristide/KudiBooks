import 'package:flutter/material.dart';

class DoubleHeader extends StatelessWidget {
  const DoubleHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15.0, top: 10),
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Recent transactions",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                )),
          ),
          Expanded(
            child: Container(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("View All"),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
