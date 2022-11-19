import 'package:flutter/cupertino.dart';
import 'package:ptc_project/model/utils/sizer.dart';
import 'package:ptc_project/view/resourse/style_manager.dart';
import '../resourse/color_manager.dart';

import '../resourse/values_manager.dart';

Widget PTCDvider(
    {double height = AppSize.s10,
    String text = '',
    List<Color> colors = const [
      ColorManager.primaryColor,
      ColorManager.secondaryColor,
    ]}) {
  return Container(
    alignment: Alignment.center,
    width: double.infinity,
    height: height,
    decoration: BoxDecoration(gradient: LinearGradient(colors: colors)),
    child: Text(
      text,
      style: getBoldStyle(color: ColorManager.white, fontSize: 14),
    ),
  );
}
