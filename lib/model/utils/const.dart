import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../view/resourse/color_manager.dart';
import '../../view/resourse/values_manager.dart';
import 'sizer.dart';

class CONSTANTSAPP{
  static LOADIG(context){
    Get.dialog(
        Center(
          child: Container(
              alignment: Alignment.center,
              width: Sizer.getW(context) * 0.2,
              height: Sizer.getW(context) * 0.2,
              decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(AppSize.s8)),
              child: LoadingAnimationWidget.hexagonDots(
                  color: ColorManager.primaryColor,
                  size: Sizer.getW(context) * 0.1)),
        ),
        barrierDismissible: false
    );
  }
}