import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kudibooks_app/models/language_model.dart';
import 'package:kudibooks_app/screens/languages/Widget/language_list.dart';

class Languages extends StatefulWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  final List flags = [
    "assets/images/US.png",
    "assets/images/RW.png",
    "assets/images/FR.png",
  ];
  final List _listLanguage = ["English", "Kinyarwanda", "Franch"];
  final List _listLanguages = ChooseLanguages.generateLanguages();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
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
              const Padding(
                padding: EdgeInsets.only(
                  left: 8.0,
                  top: 30,
                ),
                child: BackButton(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                  color: Colors.transparent,
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
              Container(
                color: Colors.transparent,
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    const Center(
                      child: Text(
                        "Choose language",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
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
          )
        ],
      ),
    );
  }
}
