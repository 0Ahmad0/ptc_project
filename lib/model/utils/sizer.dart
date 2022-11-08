import 'package:flutter/cupertino.dart';

class Sizer{
  static double getH(context){
    return MediaQuery.of(context).size.height;
  }
  static double getW(context){
    return MediaQuery.of(context).size.width;
  }
}