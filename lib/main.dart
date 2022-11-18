import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ptc_project/view/resourse/theme_manager.dart';

import 'firebase_options.dart';
import 'translations/codegen_loader.g.dart';
import 'view/screens/splash/splash_view.dart';
const apiKEY = 'AIzaSyDmnCLByB0__hIi4xVUbVLllnC8fJBMGBo';
const projectID = 'ptc-project-84660';
Future<void> main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  //await  Firebase.initializeApp();
  await Firestore.initialize('ptc-project-84660');
  if(Platform.isAndroid){
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  }
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    path: 'assets/translations/',
    supportedLocales: [
      Locale("en"),
      Locale("ar"),
    ],
    fallbackLocale: Locale("en"),
    assetLoader: CodegenLoader(),
    child: MyApp(),
  ),);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void chechConnactivity()async{
   var result = await Connectivity().checkConnectivity();
   print(result.name);
  }
  @override
  void initState() {
    super.initState();
    chechConnactivity();
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.deviceLocale,
      theme: ThemeManager.myTheme,
      home: StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          if(snapshot.data == ConnectivityResult.none){
            // AwesomeDialog(
            //   context: context,
            //   dialogType: DialogType.error,
            //   animType: AnimType.rightSlide,
            //   title: 'Connection Error',
            //   desc: 'Please check your internet',
            //   btnCancelOnPress: () {},
            //   btnOkOnPress: () {},
            // )..show();
            return Center(child: Text("data"));

          }else{
            return SplashView();
          }
        }
      ),
    );
  }
}