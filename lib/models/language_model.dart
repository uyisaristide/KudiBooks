class ChooseLanguages {
  String image;
  String languageName;

  ChooseLanguages({required this.languageName, required this.image});

  static List<ChooseLanguages> generateLanguages() {
    return [
      ChooseLanguages(languageName: "English", image: "assets/images/US.png"),
      ChooseLanguages(languageName: "Kinyarwanda", image: "assets/images/RW.png"),
      ChooseLanguages(languageName: "French", image: "assets/images/FR.png"),
    ];
  }
}
