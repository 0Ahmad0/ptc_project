
import 'dart:io';


import 'package:firedart/firedart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ptc_project/model/models.dart' as model;
import 'package:ptc_project/model/models.dart';
import 'package:ptc_project/translations/locale_keys.g.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firedart/auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import '../../../translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';



class FirebaseFun{
  static var rest;

  static createCvUser( {required CvUser cvUser}) async {
    final result =await Firestore.instance
        .collection('CvUser')
        .add(
      cvUser.toJson(),
    ).then(onValueCreateUser)
        .catchError(onError);
    if(result['status']){
      cvUser.idUser=result['body']['idUser'];
      print("id : ${result['body']['idUser']}");
      return {
        'status':true,
        'message':'Cv user successfully created',
        'body': cvUser.toJson()
      };
    }
    return result;
  }
  static fetchCvUsers()  async {
    final result=await Firestore.instance.collection('CvUser')
        .get()
        .then((onValueFetchCvUsers))
        .catchError(onError);
    return result;
  }
  static updateCvUser( {required CvUser cvUser}) async {
    final result =await Firestore.instance
        .collection('CvUser')
    .document(cvUser.idUser)
        .update(
      cvUser.toJson(),
    ).then(onValueupdateUser)
        .catchError(onError);
    if(result['status']){
      return {
        'status':true,
        'message':'Cv user successfully update',
        'body': cvUser.toJson()
      };
    }
    return result;
  }
  static deleteCvUser( {required CvUser cvUser}) async {
    final result =await Firestore.instance
        .collection('CvUser')
    .document(cvUser.idUser)
        .delete().then(onValueupdateUser)
        .catchError(onError);
    if(result['status']){
      return {
        'status':true,
        'message':'Cv user successfully delete',
        'body': cvUser.toJson()
      };
    }
    return result;
  }
/**
  static fetchGroup( {required String id})  async {
    final result=await FirebaseFirestore.instance.collection('AppConstants.collectionGroup')
        .doc(id)
        .get()
        .then((onValueFetchGroup))
        .catchError(onError);
    return result;
  }
  static fetchGroupsToUser( {required String idUser})  async {
    final result=await FirebaseFirestore.instance.collection('AppConstants.collectionGroup')
        .where('listUsers',arrayContains: idUser)
  //  .orderBy('sort')
        .get()
        .then((onValueFetchGroupToUser))
        .catchError(onError);
    return result;
  }
  static updateGroup( {required model.Group group,required String id,model.UpdateGroupType updateGroupType}) async {
    var result =await FirebaseFirestore.instance
        .collection('AppConstants.collectionGroup')
        .doc(id).update(
        group.toJsonFire()
    ).then(onValueUpdateGroup)
        .catchError(onError);
    result['status']?result['message']="group successfully ${updateGroupType.name}":"";
    return result;
  }
  *//**
  static deleteMessage( {required String idGroup,required String idMessage}) async {
    final result =await Firestore.instance
        .collection('AppConstants.collectionGroup')
        //.doc(idGroup)
        .collection('AppConstants.collectionChat')
        .doc(idMessage).delete().then(onValueDeleteMessage)
        .catchError(onError);
    return result;
  }*/
  static fetchGroups()  async {
    final result=await Firestore.instance.collection('AppConstants.collectionGroup')
       // .orderBy("sort")
        .get()
        .then((onValueFetchGroups))
        .catchError(onError);
    return result;
  }

   static Future<Map<String,dynamic>>  onError(error) async {
    print(false);
    print(error);
    return {
      'status':false,
      'message':error,
      //'body':""
    };
  }


  static Future<Map<String,dynamic>> onValueCreateUser(value) async{
    return {
      'status':true,
      'message':'Cv user successfully created',
        'body': {'idUser':value.id}
    };
  }
  static Future<Map<String,dynamic>> onValueFetchCvUsers(value) async{
    print(true);
    //print(await value.docs[0]);
    print("CvUser count : ${value.toList().length}");
    return {
      'status':true,
      'message':'CvUser successfully fetch',
      'body':value.toList()
    };
  }
  static Future<Map<String,dynamic>> onValueupdateUser(value) async{
    return {
      'status':true,
      'message':'CvUser successfully update',
      'body':{}
    };
  }





  static Future<Map<String,dynamic>> onValueSignup(value) async{
    print(true);
    print("uid : ${value.user?.uid}");
    return {
      'status':true,
      'message':'Account successfully created',
      'body':{
        'uid':value.user?.uid
      }
    };
  }
  static Future<Map<String,dynamic>> onValueUpdateUser(value) async{
    return {
      'status':true,
      'message':'Account successfully created',
    //  'body': user.toJson()
    };
  }
  static Future<Map<String,dynamic>> onValuelogin(value) async{
    //print(true);
   // print(value.user.uid);

    return {
      'status':true,
      'message':'Account successfully logged',
      'body':{
        'uid':value.user.uid}
    };
  }
  static Future<Map<String,dynamic>>onValueSendPasswordResetEmail(value) async{
    //print(true);
   // print(value.user.uid);

    return {
      'status':true,
      'message':'Email successfully send code ',
      'body':{}
    };
  }
  static Future<Map<String,dynamic>>onValueConfirmPasswordReset(value) async{
    //print(true);
   // print(value.user.uid);

    return {
      'status':true,
      'message':'password successfully rest ',
      'body':{}
    };
  }
  static Future<Map<String,dynamic>> onValuelogout(value) async{
     print(true);
     print("logout");
    return {
      'status':true,
      'message':'Account successfully logout',
      'body':{}
    };
  }
  /**
  static Future<Map<String,dynamic>> onValueFetchUser(value) async{
    print(true);
    print(await (value.docs.length>0)?value.docs[0]['uid']:null);
    print("user : ${(value.docs.length>0)?model.User.fromJson(value.docs[0]).toJson():null}");
    return {
      'status':true,
      'message':'Account successfully logged',
      'body':(value.docs.length>0)?model.User.fromJson(value.docs[0]).toJson():null
    };
  }
  static Future<Map<String,dynamic>> onValueFetchUserId(value) async{
    //print(true);
    //print(await (value.docs.length>0)?value.docs[0]['uid']:null);
   // print("user : ${(value.docs.length>0)?model.User.fromJson(value.docs[0]).toJson():null}");
    return {
      'status':true,
      'message':'Account successfully logged',
      'body':(value.docs.length>0)?model.User.fromJson(value.docs[0]).toJson():null
    };
  }
  static Future<Map<String,dynamic>> onValueCreateChat(value) async{
    return {
      'status':true,
      'message':'Chat successfully created',
      //  'body': user.toJson()
    };
  }
  static Future<Map<String,dynamic>> onValueFetchGroup(value) async{
    print(true);
    //print(await value.docs[0]);
    print("Group : ${(value.data()!=null)?model.Group.fromJsonFire(value.data()).toJson():null}");
    return {
      'status':true,
      'message':'group successfully fetch',
      'body':(value.data()!=null)?model.Group.fromJsonFire(value.data()).toJson():null
    };
  }
  static Future<Map<String,dynamic>> onValueFetchGroupToUser(value) async{
    print(true);
    //print(await value.docs[0]);
    print("Groups count : ${value.docs.length}");

    return {
      'status':true,
      'message':'groups successfully fetch',
      'body':value.docs
    };
  }
  static Future<Map<String,dynamic>> onValueUpdateGroup(value) async{
    return {
      'status':true,
      'message':'group successfully update',
      //  'body': user.toJson()
    };
  }
  static Future<Map<String,dynamic>> onValueFetchChat(value) async{
    print(true);
    //print(await value.docs[0]);
    print("Cont Messages : ${value.docs.length}");
    model.Chat chat = model.Chat.fromJson({
      'id':"",
      'messages':value.docs,
    });
    return {
      'status':true,
      'message':'Chat successfully fetch',
      'body':chat.toJson(),
    };
  }
  */
  static Future<Map<String,dynamic>> onValueAddMessage(value) async{
    return {
      'status':true,
      'message':'Message successfully add',
       'body': {'id':value.id}
    };
  }
  static Future<Map<String,dynamic>> onValueUpdateMessage(value) async{
    return {
      'status':true,
      'message':'Message successfully update',
      //  'body': user.toJson()
    };
  }
  static Future<Map<String,dynamic>> onValueDeleteMessage(value) async{
    return {
      'status':true,
      'message':'Message successfully delete',
      //  'body': user.toJson()
    };
  }
  static Future<Map<String,dynamic>> onValueFetchDoctors(value) async{
    print(true);
    //print(await value.docs[0]);
    print("Doctors count : ${value.docs.length}");

    return {
      'status':true,
      'message':'Doctors successfully fetch',
      'body':value.docs
    };
  }
  static Future<Map<String,dynamic>> onValueFetchGroups(value) async{
    print(true);
    //print(await value.docs[0]);
    print("Groups count : ${value.docs.length}");

    return {
      'status':true,
      'message':'Groups successfully fetch',
      'body':value.docs
    };
  }
  static Future<Map<String,dynamic>> onValueUpdateSession(value) async{
    return {
      'status':true,
      'message':'Session successfully update',
      //  'body': user.toJson()
    };
  }
  static Future<Map<String,dynamic>> onValueFetchSessions(value) async{
    print(true);
    print("Sessions count : ${value.docs.length}");

    return {
      'status':true,
      'message':'Sessions successfully fetch',
      'body':value.docs
    };
  }
  static Future<Map<String,dynamic>> onValueDeleteSession(value) async{
    return {
      'status':true,
      'message':'Session successfully delete',
      //  'body': user.toJson()
    };
  }
  static Future<Map<String,dynamic>> onValuefetchSessionsToUser(value) async{
    print(true);
    print("Sessions count : ${value.docs.length}");

    return {
      'status':true,
      'message':'Sessions successfully fetch',
      'body':value.docs
    };
  }
  /**
  static Future<Map<String,dynamic>> onValuefetchPaySession(value) async{
    print(true);
    print("PaySession count : ${value.docs.length}");
    var body=model.PaySession(idUser: "",checkWrite: false, listSessionPay: [DateTime.now(),DateTime.now(),DateTime.now(),DateTime.now()]).toJson();
    return {
      'status':true,
      'message':'PaySession successfully fetch',
      'body':(value.docs.length>0)?value.docs:body
    };
  }
      **/
  static Future<Map<String,dynamic>> onValueFetchUsers(value) async{
    print(true);
    print("Users count : ${value.docs.length}");

    return {
      'status':true,
      'message':'Sessions successfully fetch',
      'body':value.docs
    };
  }


  static String findTextToast(String text){
     if(text.contains("Password should be at least 6 characters")){
       //return tr(LocaleKeys.toast_short_password);
     }else if(text.contains("The email address is already in use by another account")){
       //return tr(LocaleKeys.toast_email_already_use);
     }
     else if(text.contains("Account Unsuccessfully created")){
       //return tr(LocaleKeys.toast_Unsuccessfully_created);
     }
     else if(text.contains("Account successfully created")){
       //return tr(LocaleKeys.toast_successfully_created);
     }
     else if(text.contains("The password is invalid or the user does not have a password")){
      // return tr(LocaleKeys.toast_password_invalid);
     }
     else if(text.contains("There is no user record corresponding to this identifier")){
       //return tr(LocaleKeys.toast_email_invalid);
     }
     else if(text.contains("Account successfully logged")){
       //return tr(LocaleKeys.toast_successfully_logged);
     }
     else if(text.contains("A network error")){
       //return tr(LocaleKeys.toast_network_error);
     }
     else if(text.contains("An internal error has occurred")){
      // return tr(LocaleKeys.toast_network_error);
     }else if(text.contains("field does not exist within the DocumentSnapshotPlatform")){
      // return tr(LocaleKeys.toast_Bad_data_fetch);
       return 'Bad data fetch';
     }else if(text.contains("Account successfully logged")){
    //   return tr(LocaleKeys.toast);
       return 'Account successfully logged';
     } else if(text.contains("No such host is known")){
  //   return tr(LocaleKeys.toast);
       return 'network error';
  }
     else if(text.contains("403")){
       return 'not vpn';
     }


     return text;
  }
  static int compareDateWithDateNowToDay({required DateTime dateTime}){
     int year=dateTime.year-DateTime.now().year;
     int month=dateTime.year-DateTime.now().month;
     int day=dateTime.year-DateTime.now().day;
     return (year*365+
            month*30+
            day);
  }
 /* static Future uploadImage({required XFile image, required String folder}) async {
    try {
      String path = basename(image.path);
      print(image.path);
      File file =File(image.path);

//FirebaseStorage storage = FirebaseStorage.instance.ref().child(path);
      Reference storage = FirebaseStorage.instance.ref().child("${folder}/${path}");
      UploadTask storageUploadTask = storage.putFile(file);
      TaskSnapshot taskSnapshot = await storageUploadTask;
      String url = await taskSnapshot.ref.getDownloadURL();
      return url;
    } catch (ex) {
      //Const.TOAST( context,textToast:FirebaseFun.findTextToast("Please, upload the image"));
    }
  }*/
}