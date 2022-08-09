import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UtilsServices{

 // final storage = const FlutterSecure

/*  Future<void> saveLocalData({required String key, required String data}){
    await storage
  }*/


  void showToast({required String message, required bool isError,}){
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: isError ? Colors.red : Colors.white,
      textColor: isError ? Colors.white : Colors.black,
      fontSize: 14
    );
  }
}