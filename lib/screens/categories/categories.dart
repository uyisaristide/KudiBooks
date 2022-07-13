import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/background.dart';
import 'package:kudibooks_app/screens/categories/widgets/grid_card.dart';
import 'package:kudibooks_app/screens/drawer/navigation_drawer.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
      paddingSize: 0.0,
      screens: ListView(
        shrinkWrap: true,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 50, bottom: 20),
              color: Colors.transparent,
              child: const Text(
                "Choose category",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ),
          SizedBox(
            height: 650,
            child: GridView.count(
              crossAxisCount: 2,
              // crossAxisSpacing: 20,
              children: const [
                GridCard(
                    text: 'Personal',
                    cardColor: Color(0XffB7DFF5),
                    iconImage: 'assets/images/categories/personIcon.png'),
                GridCard(
                    text: 'Shop',
                    cardColor: Color(0XffF7A593),
                    iconImage: 'assets/images/categories/shopIcon.png'),
                GridCard(
                    text: 'Restaurent',
                    cardColor: Color(0XffF7A593),
                    iconImage: 'assets/images/categories/restaurentIcon.png'),
                GridCard(
                    text: 'Hotel',
                    cardColor: Color(0XffB7DFF5),
                    iconImage: 'assets/images/categories/hotelIcon.png'),
                GridCard(
                    text: 'Supermarket',
                    cardColor: Color(0XffFDE598),
                    iconImage: 'assets/images/categories/supermarketIcon.png'),
                GridCard(
                    text: 'Pharmacy',
                    cardColor: Color(0XffD3B0E0),
                    iconImage: 'assets/images/categories/pharmacyIcon.png'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: OutlinedButton(
              onPressed: () {},
              child: const Text("Other"),
              style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(20.0),
                  side: const BorderSide(width: 1.0, color: Color(0xff157253)),
                  primary: const Color(0xff157253),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            ),
          ),
        ],
      ),
    );
  }
}
