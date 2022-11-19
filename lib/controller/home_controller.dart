
import 'dart:io';



import 'package:ptc_project/controller/utils/firebase.dart';
import 'package:ptc_project/model/test/test.dart';

import '../model/models.dart';


class HomeController {
  //static CvUser cvUser = CvUser.genCvUser();
  static CvUser cvUser = TestModel().cvUser1;//CvUser.genCvUser();
  static CvUsers cvUsers = CvUsers();//CvUser.genCvUser();
  createCvUser(context) async{
    var result =await FirebaseFun.createCvUser(cvUser: cvUser);
    print(result);

    //Const.TOAST(context,textToast: FirebaseFun.findTextToast(result['message'].toString()));
    return result;
  }
  fetchCvUsers(context) async {
    var result =await FirebaseFun.fetchCvUsers();
    print(result);
    if(result['status']){
      cvUsers=CvUsers.fromJson(result['body']);
    }
   // (!result['status'])?Const.TOAST(context,textToast: FirebaseFun.findTextToast(result['message'].toString())):"";
    return result;
  }
}