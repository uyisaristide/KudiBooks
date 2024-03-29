import 'package:flutter/material.dart';

class ActionCard extends StatelessWidget {
  Color? cardColor;
  Icon? cardIcon;
  String title;
  bool? isBordered;
  Function()? actionClick;
  Color? titleColor;
  bool? isBoxShadow;

  ActionCard(
      {this.actionClick,
      required this.title,
      this.cardColor,
      this.isBoxShadow,
      this.isBordered,
      this.cardIcon,
      this.titleColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Expanded(
    //   child: Container(
    //     margin: const EdgeInsets.only(left: 5.0),
    //     width: 100,
    //     height: 73,
    //     child: ElevatedButton(
    //       style: ElevatedButton.styleFrom(
    //           primary: cardColor,
    //           shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(10.0))),
    //       onPressed: actionClick,
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Container(
    //             child: cardIcon,
    //           ),
    //           Text(
    //             title,
    //             style: const TextStyle(color: Colors.white, fontSize: 12.6),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 3, right: 3),
        child: InkWell(
          onTap: actionClick,
          child: Container(
            height: 72,
            decoration: BoxDecoration(
                boxShadow: isBoxShadow == true
                    ? [const BoxShadow(blurRadius: 3.0, color: Colors.grey)]
                    : [],
                color: cardColor,
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(Radius.circular(10.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: cardIcon,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  title,
                  style:
                      TextStyle(fontWeight: FontWeight.w600, color: titleColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
