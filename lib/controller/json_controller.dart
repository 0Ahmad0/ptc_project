import 'dart:io';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ptc_project/model/models.dart';

import '../model/utils/const.dart';
class JsonController{

  String pathCVsExport='shared/cvs.json';
  String pathCVsImport='shared/cvs.json';
  exportCvs(BuildContext context,{required CvUsers cvUsers}){
    CONSTANTSAPP.LOADIG(context);
    writeCvsToJson(cvUsers);
    Get.back();
    CONSTANTSAPP.TOAST(context,textToast: 'done export: (${pathCVsExport})');
  }
  importCvs(BuildContext context) async {
   // CONSTANTSAPP.LOADIG(context);
    CvUsers cvUsers=await readCvsToJson(pathCVsImport);
    //Get.back();
    CONSTANTSAPP.TOAST(context,textToast: 'done import: (${pathCVsImport})');
    return cvUsers;
  }
  writeCvsToJson(CvUsers cvUsers){
    final File file = File(pathCVsExport);
     file.writeAsStringSync(json.encode(cvUsers.toJson1()));  //write (the whole list) to json file
  }
  readCvsToJson(String pathCVsImport) async {
    final File file = File(pathCVsImport);
    final contents = await file.readAsString();
    var json = jsonDecode(contents);
    CvUsers cvUsers=CvUsers.fromJson1(json['listCvUser']);
    return cvUsers;  //write (the whole list) to json file
  }
  // Future<void> readPlayerData (File file) async {
  //
  //
  //   String contents = await file.readAsString();
  //   var jsonResponse = jsonDecode(contents);
  //
  //   for(var p in jsonResponse){
  //
  //     Player player = Player(p['name'],p['age'],p['hobby']);
  //     players.add(player);
  //   }
  //
  //
  // }

}