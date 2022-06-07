import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/welcome/widgets/carousel_card.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  late PageController _pageController;
  int _currentPage = 0;

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
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: _serviceImages.length,
                controller: _pageController,
                itemBuilder: (context, index) {
                  return CarouselCard(
                    image: _serviceImages[index],
                    title: _titles[index],
                    description: _descriptions[index],
                    indexCard: index,
                  );
                }),
          ),
          Container(
              height: 175,
              color: Colors.black38,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "30 Days trial",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Login",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ))
        ],
      ),
    );
  }

  Widget buildImage(String slideImages, int index) => Container(
        child: Image.asset(
          slideImages,
        ),
      );
}
