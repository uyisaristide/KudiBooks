import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 100, left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Dashboard",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                )),
          ),
          Expanded(
            child: Container(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        elevation: 0.0,
                        primary: const Color(0xffE1E1E3)),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.black,
                    ),
                    label: const Text(
                      "Today",
                      style: TextStyle(color: Colors.black),
                    ))),
          )
        ],
      ),
    );
  }
}
