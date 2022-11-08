import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ptc_project/translations/locale_keys.g.dart';
import 'package:ptc_project/view/resourse/color_manager.dart';
import 'package:ptc_project/view/resourse/style_manager.dart';
import 'package:ptc_project/view/resourse/values_manager.dart';

import '../../../model/utils/sizer.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.foggy),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(AppPadding.p12),
                width: Sizer.getW(context) / 3,
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(AppSize.s14),
                  boxShadow:  [
                     BoxShadow(
                      color: ColorManager.lightGray.withOpacity(.3),
                      blurRadius: AppSize.s8,
                      offset: const Offset(0,4)
                    )
                  ]
                ),
                child: Column(
                  children: [
                    Text("سجل الدخول إلى حسابك",style: getBoldStyle(color: ColorManager.primaryColor,fontSize: Sizer.getH(context)/24),),
                    const SizedBox(height: AppSize.s20,),
                    TextFormField(

                    ),
                    const SizedBox(height: AppSize.s20,),
                    ElevatedButton(onPressed: (){
                      context.setLocale(Locale('ar'));
                      Get.updateLocale(context.locale);
                      setState(() {

                      });
                    }, child: Text(tr(LocaleKeys.login))),
                    const SizedBox(height: AppSize.s20,),
                    ElevatedButton(onPressed: (){
                      context.setLocale(Locale('en'));
                      Get.updateLocale(context.locale);
                      setState(() {


                      });
                    }, child: Text(tr(LocaleKeys.signup)))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
