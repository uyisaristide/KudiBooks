import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/categories/widgets/grid_card.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XffE5E5E5),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0XffE5E5E5),
          title: const Center(
            child: Text(
              'Choose Category',
              style: TextStyle(color: Colors.black),
            ),
          )),
      body: Column(
        children: [
          Expanded(
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
          Container(
              alignment: Alignment.center,
              height: 40,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color(0Xff2E7f00))),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text(
                  'Other',
                  style: TextStyle(color: Color(0Xff2E7D32)),
                ),
              )),
          Container()
        ],
      ),
    );
  }
}
