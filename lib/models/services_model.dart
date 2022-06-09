class CarouselsCard {
  String image;
  String title;
  String description;

  CarouselsCard(
      {required this.image, required this.title, required this.description});

  static List<CarouselsCard> generateList() {
    return [
      CarouselsCard(
        image: "assets/images/firstSlide.png",
        description: '',
        title: "Your accounting done right",
      ),
      CarouselsCard(
        image: "assets/images/inventorySlide.png",
        description:
            'Keep track of your stock for the ultimate goal to resale, use or production',
        title: "Inventory",
      ),
      CarouselsCard(
        image: "assets/images/budgetingSlide.png",
        description:
            'Keep track of your stock for the ultimate goal to resale, use or production',
        title: "Budgeting",
      ),
      CarouselsCard(
        image: "assets/images/expenses.png",
        description: 'This framework allows you to track your expenses at easy',
        title: "Expenses",
      ),
      CarouselsCard(
        image: "assets/images/reportingSlide.png",
        description:
            'Balance sheet, income statement, cash flow statement and other commonly used financial reports',
        title: "Reporting",
      ),
    ];
  }
}
