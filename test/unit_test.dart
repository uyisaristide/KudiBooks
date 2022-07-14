// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

void main() {

  String getString(String s){
    if(s.length<=3){
      return s;
    }else if(s.length%2==0){
      return s.substring(1);
    }
    return s.substring(2);
  }
  var a=getString("Hello");
  var b=getString("Hi");
  var c=getString("How are you");
  var d=getString("Good");

  group("testing get string function", (){

    test("Get string function 1",(){
      expect(a,"llo");
    });

    test("Get string function 2",(){
      expect(b, "Hi");
    });
    test("Get string function 3",(){
      expect(c, "w are you");
    });

    test("Get string function 4",(){
      expect(d,"ood");
    });

    test("Get string function 4",(){
      var v="Greetings";
      expect(v,"Greetings");
      expect(v,isNotNull);
      v="1";
      expect(v, "1");
      var c=int.parse(v);
      expect(c.runtimeType,int);

    });

  });
}
