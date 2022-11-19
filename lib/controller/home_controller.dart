
import 'dart:io';



import 'package:ptc_project/controller/utils/firebase.dart';
import 'package:ptc_project/model/test/test.dart';

import '../model/models.dart';
import '../model/utils/const.dart';
import '../view/screens/search/search_view.dart';


class HomeController {
  static CvUser cvUser = CvUser.genCvUser();
  //static CvUser cvUserHome = CvUser.genCvUser();
  static CvUser cvUserHome = TestModel().cvUser1;//CvUser.genCvUser();
  static CvUser cvUserView = CvUser.genCvUser();//CvUser.genCvUser();
  static CvUsers cvUsers = CvUsers();//CvUser.genCvUser();
  static CvUsers cvUsersSearch = CvUsers();//CvUser.genCvUser();
  static var setStateSearch;
  static Map<String,List> mapSearch=Map<String,List>();
  createCvUser(context) async{
    var result =await FirebaseFun.createCvUser(cvUser: cvUser);
    print(result);

    //Const.TOAST(context,textToast: FirebaseFun.findTextToast(result['message'].toString()));
    return result;
  }
  fetchCvUsers(context) async {
    var result =await FirebaseFun.fetchCvUsers();
    if(result['status']){
      cvUsers=CvUsers.fromJson(result['body']);
    }
    (!result['status'])?CONSTANTSAPP.TOAST(context,textToast: FirebaseFun.findTextToast(result['message'].toString())):"";
    return result;
  }
  updateCvUser(context) async{
    print(cvUser.idUser);
    var result =await FirebaseFun.updateCvUser(cvUser: cvUser);
    print(result);
    CONSTANTSAPP.TOAST(context,textToast: FirebaseFun.findTextToast(result['message'].toString()));
    return result;
  }
  deleteCvUser(context) async{
    var result =await FirebaseFun.deleteCvUser(cvUser: cvUser);
    print(result);
    CONSTANTSAPP.TOAST(context,textToast: FirebaseFun.findTextToast(result['message'].toString()));
    return result;
  }
  convertToMapSearch(List<DataSearch> listDataSearch,List<String> itemSearch){
     Map<dynamic,List> tempMapSearch=Map<dynamic,List>();
     for(DataSearch dataSearch in listDataSearch){
       if(tempMapSearch['${itemSearch[dataSearch.id]}']==null)
         tempMapSearch['${itemSearch[dataSearch.id]}']=[];
       tempMapSearch['${itemSearch[dataSearch.id]}']?.add(dataSearch.name);
     }
     print(tempMapSearch);
     return tempMapSearch;
  }
  search( CvUsers cvUsers){
    return cvUsers;
  }
}