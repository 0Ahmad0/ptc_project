
import 'dart:io';



import 'package:ptc_project/controller/utils/firebase.dart';

import '../model/models.dart';


class HomeController {
  static CvUser cvUser = CvUser.genCvUser();
  createCvUser(context) async{
    var result =await FirebaseFun.createCvUser(cvUser: cvUser);
    print(result);
    //Const.TOAST(context,textToast: FirebaseFun.findTextToast(result['message'].toString()));
    return result;
  }

}