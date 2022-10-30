import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'enum.dart';

class ShowToast {
  ShowToast({String? msg, ErrorType? type}) {
    Color backgroundColor; // = Color(0xffE23636)

    switch(type) {
      case ErrorType.error:
        backgroundColor = const Color(0xffE23636);
        break;
      case ErrorType.warning:
        backgroundColor = const Color(0xffEDB95E);
        break;
      case ErrorType.info:
        backgroundColor = const Color(0xff95fdf9);
        break;
      default:
        backgroundColor = const Color(0xff82DD55);
    }


    Fluttertoast.showToast(
      fontSize: 20,
        toastLength: Toast.LENGTH_LONG,
        msg: msg!, backgroundColor:  backgroundColor, textColor: Colors.white);
  }
}