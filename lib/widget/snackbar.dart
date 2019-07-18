import 'package:flutter/material.dart';

class MySnackBar {
  static SnackBarByKey(final GlobalKey<ScaffoldState> scaffoldkey,
      BuildContext context, String str) {
    final mySnackBar = SnackBar(
        content: Text(
      str,
      textAlign: TextAlign.center,
    ));
    scaffoldkey.currentState.showSnackBar(mySnackBar);
  }
}
