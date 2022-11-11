import 'package:flutter/cupertino.dart';
import '../resourse/color_manager.dart';

import '../resourse/values_manager.dart';

Widget PTCDvider({double height = AppSize.s10}){
  return       Container(
    width: double.infinity,
    height: height,
    decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              ColorManager.primaryColor,
              ColorManager.secondaryColor,
            ]
        )
    ),
  );
}