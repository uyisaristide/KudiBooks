import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/languages/choose_language.dart';
import 'package:kudibooks_app/screens/welcome/widgets/carousel_card.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 1);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
  }

  final List carouselCard = [
    CarouselCard(
      image: "assets/images/firstSlide.png",
      description: '',
      title: "Your accounting done right",
    ),
    CarouselCard(
      image: "assets/images/inventorySlide.png",
      description:
          'Keep track of your stock for the ultimate goal to resale, use or production',
      title: "Inventory",
    ),
    CarouselCard(
      image: "assets/images/budgetingSlide.png",
      description:
          'Keep track of your stock for the ultimate goal to resale, use or production',
      title: "Budgeting",
    ),
    CarouselCard(
      image: "assets/images/expenses.png",
      description: 'This framework allows you to track your expenses at easy',
      title: "Expenses",
    ),
    CarouselCard(
      image: "assets/images/reportingSlide.png",
      description:
          'Balance sheet, income statement, cash flow statement and other commonly used financial reports',
      title: "Reporting",
    ),
  ];
  final List carouseLs = [
    [
      "assets/images/firstSlide.png",
      " ",
      "Your accounting done right",
    ]
  ];

  final List<String> _serviceImages = [
    "assets/images/firstSlide.png",
    "assets/images/inventorySlide.png",
    "assets/images/budgetingSlide.png",
    "assets/images/expenses.png",
    "assets/images/reportingSlide.png"
  ];

  final List<String> _titles = [
    "Your accounting done right",
    "Inventory",
    "Budgeting",
    "Expenses",
    "Reporting"
  ];
  final List<String> _descriptions = [
    "",
    "Keep track of your stock for the ultimate goal to resale, use or production",
    "This framework allows you to create your financial plan so you can monitor your progress",
    "This framework allows you to track your expenses at easy",
    "Balance sheet, income statement, cash flow statement and other commonly used financial reports"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 150,
              left: 250,
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(color: Colors.green),
              )),
          Positioned(
              top: 30,
              left: 60,
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(color: Colors.amber),
              )),
          Positioned(
              top: 200,
              left: -80,
              child: Container(
                height: 200,
                width: 100,
                decoration: const BoxDecoration(color: Colors.amber),
              )),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 75.0, sigmaY: 75.0),
            child: Container(
              color: Colors.white.withOpacity(.2),
            ),
          ),
          Column(
            children: [
              Flexible(
                child: PageView.builder(
                    onPageChanged: (index) =>
                        setState(() => _currentPage = index),
                    physics: const ClampingScrollPhysics(),
                    itemCount: _serviceImages.length,
                    controller: _pageController,
                    itemBuilder: (context, index) {
                      // return const BackgroundBlur();
                      return CarouselCard(
                        image: _serviceImages[index],
                        title: _titles[index],
                        description: _descriptions[index],
                        indexCard: index,
                      );
                    }),
              ),
              SizedBox(
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _serviceImages
                            .map((e) => Container(
                                  margin: const EdgeInsets.all(2.0),
                                  height: 12,
                                  width: 12,
                                  decoration: BoxDecoration(
                                      color: _serviceImages.indexOf(e) ==
                                              _currentPage
                                          ? Colors.grey
                                          : null,
                                      border: Border.all(
                                          color: Colors.grey, width: 1.0),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(50))),
                                ))
                            .toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.0))),
                                padding:
                                    const EdgeInsets.only(top: 15, bottom: 15),
                                primary: const Color(0xff157253),
                                minimumSize: const Size(254, 45)),
                            onPressed: () {},
                            child: const Text(
                              "Start your 30-day trial",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: Colors.white),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.0))),
                                padding:
                                    const EdgeInsets.only(top: 15, bottom: 15),
                                side: BorderSide(
                                    width: 1.0,
                                    color: Colors.grey.withOpacity(0.7)),
                                primary: const Color(0xff157253),
                                minimumSize: const Size(254, 45)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => const Languages()));
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.0),
                            )),
                      ),
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }

  Widget buildImage(String slideImages, int index) => Image.asset(
        slideImages,
      );
}
