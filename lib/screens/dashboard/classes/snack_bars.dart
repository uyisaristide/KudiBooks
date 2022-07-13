import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/dashboard/new_account.dart';

class SnackBars {
  Function()? floatingAction;

  static snackBars(String textSnack, Color colorSnack) {
    return SnackBar(
      duration: const Duration(seconds: 1),
      // behavior: SnackBarBehavior.floating,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
      ),
      backgroundColor: colorSnack,
      content: Text(
        textSnack,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 17),
      ),
    );
  }
}
