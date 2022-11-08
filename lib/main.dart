import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ptc_project/view/resourse/theme_manager.dart';

import 'translations/codegen_loader.g.dart';
import 'view/screens/splash/splash_view.dart';

Future<void> main() async{
  await WidgetsFlutterBinding.ensureInitialized();
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.deviceLocale,
      theme: ThemeManager.myTheme,
      home: SplashView(),
    );
  }
}