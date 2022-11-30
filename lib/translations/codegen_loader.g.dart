// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "app_name": "",
  "login": "تسجيل الدخول",
  "signup": "إنشاء حساب",
  "your_name": "الاسم الثلاثي",
  "your_age": "العمر",
  "your_gender": "الجنس",
  "your_data_birth": "تاريخ الميلاد",
  "your_nationality": "الجنسية",
  "your_address": "العنوان",
  "your_email": "الايميل",
  "your_phone": "رقم الهاتف",
  "your_military_status": "الخدمة الالزامية",
  "your_marital": "الوضع العائلي",
  "your_qualification": "المؤهلات الدراسية",
  "your_languages": "اللغات",
  "your_skills": "الخبرات",
  "your_courses": "الشهادات"
};
static const Map<String,dynamic> en = {
  "app_name": "",
  "login": "Login",
  "signup": "Sign up",
  "your_name": "Your Name",
  "your_age": "Your Age",
  "your_gender": "Your Gender",
  "your_data_birth": "Your Data Birth",
  "your_nationality": "Your Nationality",
  "your_address": "Your Address",
  "your_email": "Your Email",
  "your_phone": "Your Phone",
  "your_military_status": "Your Military Status",
  "your_marital": "Your Marital",
  "your_qualification": "Your Qualification",
  "your_languages": "Your Languages",
  "your_skills": "Your Skills",
  "your_courses": "Your Courses"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
