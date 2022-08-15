import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kudibooks_app/models/language_model.dart';
import 'package:kudibooks_app/screens/languages/Widget/language_list.dart';
import 'package:kudibooks_app/screens/welcome/widgets/background_stack.dart';

class Languages extends StatefulWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  final List _listLanguages = ChooseLanguages.generateLanguages();

  @override
  Widget build(BuildContext context) {
    return BackgroundBlur(
      screens: Column(
        children: [
          Container(
              height: 390,
              margin: const EdgeInsets.only(top: 100),
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Image.asset(
                  "assets/images/languageIcon.png",
                  height: 105,
                  width: 105,
                ),
              )),
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const Center(
                  child: Text(
                    "Choose language",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Center(
                  child: Text(
                    "What language do you want to use",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => LanguageList(
                            chooseLanguages: _listLanguages[index],
                          ),
                      separatorBuilder: (_, index) => const SizedBox(
                            height: 10,
                          ),
                      itemCount: _listLanguages.length),
                )
              ],
            ),
          ),
        ],
      ),
      paddingSize: 0.0,
    );
  }
}
