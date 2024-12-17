import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class FlushBarApp{

  FlushBarApp._();

  static void show(BuildContext context, String message) {
    Flushbar(
      flushbarStyle: FlushbarStyle.FLOATING,
      margin: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(8),
      duration: const Duration(milliseconds: 1500),
      message: message,
      icon: Icon(Icons.check, color: Colors.white,),
    ).show(context);
  }
}