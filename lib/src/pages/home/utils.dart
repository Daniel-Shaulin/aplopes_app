


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  static Color statusColor({required String status}){
    switch(status){
      case 'online':
        return Colors.green;
      case 'inativo':
        return Colors.orange;
      case 'naoperturbar':
        return Colors.red;
      case 'ocupado':
        return Colors.red;
      default:
        return Colors.white;
    }
  }

}
