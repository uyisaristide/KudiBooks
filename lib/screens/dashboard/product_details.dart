import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/dashboard/widget/title_double.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({Key? key}) : super(key: key);
  List<Widget> listOfSmallCards = [
    Container(
      margin: const EdgeInsets.only(right: 5),
      height: 72,
      width: 82,
      decoration: BoxDecoration(
          border: Border.all(width: 1.0),
          boxShadow: [
            // BoxShadow(
            //   color: Colors.grey.withOpacity(0.1),
            //   spreadRadius: 1,
            //   blurRadius: 1,
            //   offset: const Offset(0, 0),
            // )
          ],
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: const Icon(
              Icons.shopping_cart_outlined,
              color: Color(0xff157253),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Sell',
          )
        ],
      ),
    ),
    Container(
      margin: const EdgeInsets.only(right: 5),
      height: 72,
      width: 82,
      decoration: BoxDecoration(
          border: Border.all(width: 1.0),
          boxShadow: [
            // BoxShadow(
            //   color: Colors.grey.withOpacity(0.1),
            //   spreadRadius: 1,
            //   blurRadius: 1,
            //   offset: const Offset(0, 0),
            // )
          ],
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: const Icon(
              Icons.check_circle_outline_sharp,
              color: Colors.green,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Used',
          )
        ],
      ),
    ),
    Container(
      margin: const EdgeInsets.only(right: 5),
      height: 72,
      width: 82,
      decoration: BoxDecoration(
          border: Border.all(width: 1.0),
          boxShadow: [
            // BoxShadow(
            //   color: Colors.grey.withOpacity(0.1),
            //   spreadRadius: 1,
            //   blurRadius: 1,
            //   offset: const Offset(0, 0),
            // )
          ],
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.remove_circle_outline_rounded,
            color: Color(0xffA70C4A),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Damaged',
          )
        ],
      ),
    ),
    Container(
      height: 72,
      width: 82,
      decoration: BoxDecoration(
          border: Border.all(width: 1.0),
          boxShadow: [
            // BoxShadow(
            //   color: Colors.grey.withOpacity(0.1),
            //   spreadRadius: 1,
            //   blurRadius: 1,
            //   offset: const Offset(0, 0),
            // )
          ],
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: const Icon(
              Icons.edit_outlined,
              color: Color(0xffFDAB30),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Edit',
          )
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppBar(
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.pop(context)),
              automaticallyImplyLeading: true,
              elevation: 0.0,
              backgroundColor: const Color(0xff157253),
              centerTitle: true,
              title: const Text("Product details",
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.all(30.0),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffC4C4C4)),
                        height: 85,
                        width: 85,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            const Positioned(
                                left: 60,
                                top: 60,
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.grey,
                                )),
                            Positioned(
                              child: Image.asset(
                                "assets/images/itemImage.png",
                                height: 54.0,
                                width: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Text("Product full name here",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "About the product, this is the description of the product",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    )
                  ],
                ),
              ),
              Row(
                  children: listOfSmallCards
                      .map((e) => Expanded(
                            child: e,
                          ))
                      .toList()),
              DoubleHeader(
                rightSide: "Transactions",
                iconButton2: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
                iconButton: const Text("View all"),
              ),
              SizedBox(
                  height: 400,
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => ListTile(
                            subtitle: const Text("20 April 2022"),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "\$25.99",
                                ),
                                Text(
                                  index % 2 == 0 ? "Approved" : "In process",
                                  style: TextStyle(
                                    color: index % 2 == 0
                                        ? Colors.green
                                        : Colors.amber,
                                  ),
                                )
                              ],
                            ),
                            title: const Text(
                              "Transaction name",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            leading: CircleAvatar(
                              backgroundColor: const Color(0xffC4C4C4),
                              child: Text(
                                "${++index}",
                                style: TextStyle(
                                    color: index % 2 == 0
                                        ? Colors.amber
                                        : Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                      separatorBuilder: (_, idx) => const SizedBox(
                            height: 5,
                          ),
                      itemCount: 15))
            ],
          ),
        ),
      ),
    );
  }
}
