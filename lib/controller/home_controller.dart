
import 'dart:io';



import 'package:get/get.dart';
import 'package:ptc_project/controller/utils/firebase.dart';
import 'package:ptc_project/model/test/test.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/models.dart';
import '../model/utils/const.dart';
import '../view/screens/search/search_view.dart';


class HomeController {
  static CvUser cvUser = CvUser.genCvUser();
  static CvUser cvUserHome = CvUser.genCvUser();
  //static CvUser cvUserHome = CvUser.fromJson(TestModel().cvUser1.toJson());//CvUser.genCvUser();
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
    print(cvUsers.toJson());
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
     Map<String,List> tempMapSearch=Map<String,List>();
     for(DataSearch dataSearch in listDataSearch){
       if(tempMapSearch['${itemSearch[dataSearch.id]}']==null)
         tempMapSearch['${itemSearch[dataSearch.id]}']=[];
       tempMapSearch['${itemSearch[dataSearch.id]}']?.add(dataSearch.name);
     }
     print(tempMapSearch);
     return tempMapSearch;
  }
  search( CvUsers cvUsers){

    CvUsers cvUsersSearch =cvUsers;
    for(var value in mapSearch.keys){
      switch (value){
        case 'All':
          cvUsersSearch =searchAll(cvUsersSearch, mapSearch['All']!=null?mapSearch['All']!:[]);
          break;
        case 'PersonalInformation':
          cvUsersSearch=searchPersonalInformation(cvUsersSearch, mapSearch['PersonalInformation']!=null?mapSearch['PersonalInformation']!:[]);
          break;
        case 'Languages':
          cvUsersSearch=searchLanguages(cvUsersSearch, mapSearch['Languages']!=null?mapSearch['Languages']!:[]);
          break;
        case 'Skills':
          cvUsersSearch=searchSkills(cvUsersSearch, mapSearch['Skills']!=null?mapSearch['Skills']!:[]);
          break;
        case 'Courses':
          cvUsersSearch=searchCourses(cvUsersSearch, mapSearch['Courses']!=null?mapSearch['Courses']!:[]);
          break;
        case 'WorkPlaces':
          cvUsersSearch=searchWorkPlaces(cvUsersSearch, mapSearch['WorkPlaces']!=null?mapSearch['WorkPlaces']!:[]);
          break;
        case 'Works':
          cvUsersSearch=searchWorks(cvUsersSearch, mapSearch['Works']!=null?mapSearch['Works']!:[]);
          break;
        case 'Projects':
          cvUsersSearch=searchProjects(cvUsersSearch, mapSearch['Projects']!=null?mapSearch['Projects']!:[]);
          break;
        case 'TechnicalSkills':
          cvUsersSearch=searchTechnicalSkills(cvUsersSearch, mapSearch['TechnicalSkills']!=null?mapSearch['TechnicalSkills']!:[]);
          break;
        case 'learns':
          cvUsersSearch=searchLearns(cvUsersSearch, mapSearch['learns']!=null?mapSearch['learns']!:[]);
          break;
        default:

          break;
      }
    }
    return cvUsersSearch;
  }
  searchTechnicalSkills(CvUsers cvUsers,List values){
    CvUsers cvUsersSearch = CvUsers(listCvUser: []);
    for(CvUser cvUser in cvUsers.listCvUser){
      bool checkCvSearch=false;
      for(TechnicalSkill technicalSkill in cvUser.technicalSkills.listTechnicalSkill){
        if(checkListContainsValues(technicalSkill.toJson().values, values)){
          checkCvSearch=true;
        }
      }
      if(checkCvSearch) cvUsersSearch.listCvUser.add(cvUser);
    }
    return cvUsersSearch;
  }
  searchProjects(CvUsers cvUsers,List values){
    CvUsers cvUsersSearch = CvUsers(listCvUser: []);
    for(CvUser cvUser in cvUsers.listCvUser){
      bool checkCvSearch=false;
      for(Project project in cvUser.projects.listProject){
        if(checkListContainsValues(project.toJson().values, values)){
          checkCvSearch=true;
        }
      }
      if(checkCvSearch) cvUsersSearch.listCvUser.add(cvUser);
    }
    return cvUsersSearch;
  }
  searchLearns(CvUsers cvUsers,List values){
    CvUsers cvUsersSearch = CvUsers(listCvUser: []);
    for(CvUser cvUser in cvUsers.listCvUser){
      bool checkCvSearch=false;
      for(Learn learn in cvUser.learns.listLearn){
        if(checkListContainsValues(learn.toJson().values, values)){
          checkCvSearch=true;
        }
      }
      if(checkCvSearch) cvUsersSearch.listCvUser.add(cvUser);
    }
    return cvUsersSearch;
  }
  searchLanguages(CvUsers cvUsers,List values){
    CvUsers cvUsersSearch = CvUsers(listCvUser: []);
    for(CvUser cvUser in cvUsers.listCvUser){
      bool checkCvSearch=false;
      for(Language language in cvUser.languages.listLanguage){
        if(checkListContainsValues(language.toJson().values, values)){
          checkCvSearch=true;
        }
      }
      if(checkCvSearch) cvUsersSearch.listCvUser.add(cvUser);
    }
    return cvUsersSearch;
  }
  searchSkills(CvUsers cvUsers,List values){
    CvUsers cvUsersSearch = CvUsers(listCvUser: []);
    for(CvUser cvUser in cvUsers.listCvUser){
      bool checkCvSearch=false;
      for(Skill skill in cvUser.skills.listSkill){
        if(checkListContainsValues(skill.toJson().values, values)){
          checkCvSearch=true;
        }
      }
      if(checkCvSearch) cvUsersSearch.listCvUser.add(cvUser);
    }
    return cvUsersSearch;
  }
  searchCourses(CvUsers cvUsers,List values){
    CvUsers cvUsersSearch = CvUsers(listCvUser: []);
    for(CvUser cvUser in cvUsers.listCvUser){
      bool checkCvSearch=false;
      for(Course course in cvUser.courses.listCourse){
        if(checkListContainsValues(course.toJson().values, values)){
          checkCvSearch=true;
        }
      }
      if(checkCvSearch) cvUsersSearch.listCvUser.add(cvUser);
    }
    return cvUsersSearch;
  }
  searchWorkPlaces(CvUsers cvUsers,List values){
    CvUsers cvUsersSearch = CvUsers(listCvUser: []);
    for(CvUser cvUser in cvUsers.listCvUser){
      bool checkCvSearch=false;
      for(var workPlace in cvUser.workPlaces.listWorkPlace){
        if(checkListContainsValues(workPlace.valuesWorkPlace(), values)){
          checkCvSearch=true;
        }
      }
      if(checkCvSearch) cvUsersSearch.listCvUser.add(cvUser);
    }
    return cvUsersSearch;
  }
  searchWorks(CvUsers cvUsers,List values){
    CvUsers cvUsersSearch = CvUsers(listCvUser: []);
    for(CvUser cvUser in cvUsers.listCvUser){
      bool checkCvSearch=false;
      for(var workPlace in cvUser.workPlaces.listWorkPlace){
          if (checkListContainsValues(workPlace.works.values(), values)) {
            checkCvSearch = true;
          }
      }
      if(checkCvSearch) cvUsersSearch.listCvUser.add(cvUser);
    }
    return cvUsersSearch;
  }
  searchPersonalInformation(CvUsers cvUsers,List values){
    CvUsers cvUsersSearch = CvUsers(listCvUser: []);
    for(CvUser cvUser in cvUsers.listCvUser){
      bool checkCvSearch=false;
        if(checkListContainsValues(cvUser.personalInformation.values(), values)){
          checkCvSearch=true;
      }
      if(checkCvSearch) cvUsersSearch.listCvUser.add(cvUser);
    }
    return cvUsersSearch;
  }
  searchAll(CvUsers cvUsers,List values){
    CvUsers cvUsersSearch = CvUsers(listCvUser: []);
    for(CvUser cvUser in cvUsers.listCvUser){
      bool checkCvSearch=false;
      if(checkListContainsValues(cvUser.values(), values)){
        checkCvSearch=true;
      }
      if(checkCvSearch) cvUsersSearch.listCvUser.add(cvUser);
    }
    return cvUsersSearch;
  }
  bool checkListContainsValues(Iterable list,List values){

    bool check=true;
    for(var value in values){
      if(!list.contains(value))
        check= false;
    }
    return check;
  }
  Future<void> goToUrl(context,String idLink) async {
    var urllaunchable = await canLaunchUrl(Uri.parse(idLink)); //canLaunch is from url_launcher package
    if(urllaunchable){
      CONSTANTSAPP.LOADIG(context);
      await launchUrl(Uri.parse(idLink),mode: LaunchMode.externalApplication);
      Get.back();//launch is from url_launcher package to launch URL
    }else{
      CONSTANTSAPP.TOAST(context,textToast: FirebaseFun.findTextToast("URL can't be launched."));
    }
  }

findLastLearn(CvUser cvUser){
    String lastListLearn='';
    List<Learn> listTemp =[];
    Learn lastLearn=Learn.genCourse();
    for(var value in cvUser.learns.listLearn){
      if(!value.endDateForNow) listTemp.add(value);
      else if(value.startDate.compareTo(lastLearn.startDate)>0)
        lastLearn=value;
    }
    if(listTemp.length<1)
      listTemp.add(lastLearn);
    for(var value in listTemp){
      lastListLearn+=' ${value.nameUniversity}-${value.learnYear} ,';
    }
    return lastListLearn;
}
findLastWorkPlace(CvUser cvUser){
    String lastList='';
    List<WorkPlace> listTemp =[];
    var last=WorkPlace.genCourse();
    for(var value in cvUser.workPlaces.listWorkPlace){
      if(!value.endDateForNow) listTemp.add(value);
      else if(value.startDate.compareTo(last.startDate)>0)
        last=value;
    }
    if(listTemp.length<1)
      listTemp.add(last);
    for(var value in listTemp){
      lastList+=' ${value.nameWorkPlace}-${value.companyWorkPlace} ,';
    }
    return lastList;
  }

  bool validPage1(CvUser cvUser){
    return cvUser.personalInformation.validate()&&cvUser.learns.validate();
  }
  bool validPage3(CvUser cvUser){
    return cvUser.workPlaces.validate();
  }
  bool validPage2(CvUser cvUser){
    return cvUser.languages.validate()&&cvUser.skills.validate()&&cvUser.courses.validate();
  }
  bool validPage4(CvUser cvUser){
    return cvUser.projects.validate()&&cvUser.technicalSkills.validate();
  }
  bool validAll(CvUser cvUser){
    return cvUser.validate();
  }
}