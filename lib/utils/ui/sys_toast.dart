import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SysToast {
  static void showToast({String message}) {
    // Fluttertoast.showToast(msg: message);
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  static void showToastLong({String message}) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_LONG);
  }
}