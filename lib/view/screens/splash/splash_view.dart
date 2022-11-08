import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:ptc_project/view/screens/home/home_view.dart';
import 'package:ptc_project/view/screens/signup/sign_up_view.dart';
import '/view/resourse/assets_manager.dart';
import '../../resourse/const_manager.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: ConstManager.logoDelay),(){
      Get.off(()=>HomeView());
    });
    return Scaffold(
      body: Center(
        child: ZoomIn(
            duration: const Duration(seconds: ConstManager.logoDelay),
            child: Image.asset(AssetsManager.logoIMG)),
      ),
    );
  }
}