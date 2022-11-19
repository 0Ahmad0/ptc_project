import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:oktoast/oktoast.dart';
import '../../view/resourse/color_manager.dart';
import '../../view/resourse/style_manager.dart';
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



  static TOAST(
      BuildContext context,
  {String textToast = "This Is Toast",
        Color color = ColorManager.lightGray,
      }){
    // showToast(
    //     textToast,
    //     context: context,
    //     animation:StyledToastAnimation.fadeScale,
    //     textStyle: getRegularStyle(color: ColorManager.white)
    // );
    showToast(
        '$textToast',
      context: context,
      animationCurve: Curves.easeInOut,
      backgroundColor: color.withOpacity(.75),
      textStyle: TextStyle(
        color: ColorManager.black
      ),

      position: ToastPosition.bottom,
      radius: 100,
      textPadding: EdgeInsets.symmetric(
        vertical: AppPadding.p8,
        horizontal: AppPadding.p14
      )

    );
  }

  // static SHOWRATEDIALOOG(BuildContext context){
  //   Get.dialog(
  //
  //     Center(
  //       child: Material(
  //         color: Colors.transparent,
  //         child: Container(
  //           margin: const EdgeInsets.symmetric(
  //               horizontal: AppMargin.m10,
  //               vertical: AppMargin.m20),
  //           padding: EdgeInsets.symmetric(
  //               horizontal: AppPadding.p20,
  //               vertical: AppPadding.p10),
  //           width: Sizer.getW(context),
  //           decoration: BoxDecoration(
  //               color: Theme.of(context).cardColor,
  //               borderRadius:
  //               BorderRadius.circular(AppSize.s14)),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               const SizedBox(height: AppSize.s30,),
  //               Text(
  //                 tr(LocaleKeys.rate),
  //                 style: getRegularStyle(
  //                     color: Theme.of(context).textTheme.bodyText1!.color,
  //                     fontSize: Sizer.getW(context) * 0.045
  //                 ),
  //               ),
  //               const SizedBox(height: AppSize.s40,),
  //               RatingBar.builder(
  //                   initialRating: 3,
  //                   itemCount: 5,
  //                   itemBuilder: (context, index) {
  //                     switch (index) {
  //                       case 0:
  //                         return Icon(
  //                           Icons.sentiment_very_dissatisfied,
  //                           color: Colors.red,
  //                         );
  //                       case 1:
  //                         return Icon(
  //                           Icons.sentiment_dissatisfied,
  //                           color: Colors.redAccent,
  //                         );
  //                       case 2:
  //                         return Icon(
  //                           Icons.sentiment_neutral,
  //                           color: Colors.amber,
  //                         );
  //                       case 3:
  //                         return Icon(
  //                           Icons.sentiment_satisfied,
  //                           color: Colors.lightGreen,
  //                         );
  //                       case 4:
  //                         return Icon(
  //                           Icons.sentiment_very_satisfied,
  //                           color: Colors.green,
  //                         );
  //                     }
  //                     return SizedBox();
  //                   },
  //                   onRatingUpdate: (rating) {
  //                     print(rating);
  //
  //                   }
  //               ),
  //               const SizedBox(height: AppSize.s20,),
  //               ButtonApp(
  //                 text: tr(LocaleKeys.ok),
  //                 onTap: (){
  //                   Navigator.pop(context);
  //                   Const.TOAST(context,textToast: tr(LocaleKeys.thanks_for_rate));
  //                 },
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // static SHOWDELETEDIALOOG(BuildContext context){
  //   Get.dialog(
  //
  //     Center(
  //       child: Material(
  //         color: Colors.transparent,
  //         child: Container(
  //           margin: const EdgeInsets.symmetric(
  //               horizontal: AppMargin.m10,
  //               vertical: AppMargin.m20),
  //           padding: EdgeInsets.symmetric(
  //               horizontal: AppPadding.p20,
  //               vertical: AppPadding.p10),
  //           width: Sizer.getW(context),
  //           decoration: BoxDecoration(
  //               color: Theme.of(context).cardColor,
  //               borderRadius:
  //               BorderRadius.circular(AppSize.s14)),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               const SizedBox(height: AppSize.s30,),
  //               Text(
  //                 tr(LocaleKeys.delete),
  //                 style: getRegularStyle(
  //                     color: Theme.of(context).textTheme.bodyText1!.color,
  //                     fontSize: Sizer.getW(context) * 0.045
  //                 ),
  //               ),
  //               const SizedBox(height: AppSize.s40,),
  //               Row(
  //                 children: [
  //                   ButtonApp(
  //                     text: tr(LocaleKeys.ok),
  //                     onTap: (){
  //                       Navigator.pop(context);
  //                       Const.TOAST(context,textToast: tr(LocaleKeys.rate));
  //                     },
  //                   ),
  //                   ButtonApp(
  //                     text: tr(LocaleKeys.no),
  //                     onTap: (){
  //                       Navigator.pop(context);
  //                       Const.TOAST(context,textToast: tr(LocaleKeys.rate));
  //                     },
  //                   )
  //                 ],
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  static SHOWLOADINGINDECATOR(){
    return Center(
      child: CircularProgressIndicator(
      ),
    );
  }
}