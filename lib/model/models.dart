import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firedart/auth/user_gateway.dart';
import 'package:flutter/cupertino.dart';

class UserLanguage {
  String? lanName;
  int? level;

  UserLanguage({this.lanName, this.level});
}

class UserSkils {
  String? skilName;
  int? level;

  UserSkils({this.skilName, this.level});
}

class UserCourses {
  String? courseName;
  DateTime? courseDate;
  String? courseDescription;
  int? level;
  String? courseCertificate;
  String? certificate;
  String? certificateType;
  String? certificateSide;

  UserCourses({this.courseName,
    this.courseDate,
    this.courseDescription,
    this.level,
    this.courseCertificate,
    this.certificate,
    this.certificateType,
    this.certificateSide});
}
class UserWork{
  String name;
  UserWork({required this.name});
}
class UserPlaceWork{
  String name;
  String company;
  UserPlaceWork({required this.name,required this.company});
}
class UserProject{
  String name;
  UserProject({required this.name});
}class UserTechnicalSkills{
  String name;
  UserTechnicalSkills({required this.name});
}



class CvUsers {
  List<CvUser> listCvUser;

  CvUsers({
    this.listCvUser=const []
  });

  factory CvUsers.fromJson(List json){
    List<CvUser> tempListCvUser = [];
    for(int i=0;i<json.length;i++){
      CvUser cvUser =CvUser.fromJson(json[i]);
      cvUser.index=i;
      tempListCvUser.add(cvUser);
    }
    return CvUsers(
      listCvUser: tempListCvUser,
    );
  }
  Map<String,dynamic> toJson(){
    List<Map<String,dynamic>> tempListCvUser = [];
    for(CvUser cvUser in listCvUser){
      tempListCvUser.add(cvUser.toJson());
    }
    return{
      'listCvUser':tempListCvUser,
    };
  }

  factory CvUsers.fromJson1(List json){
    List<CvUser> tempListCvUser = [];
    for(int i=0;i<json.length;i++){
      CvUser cvUser =CvUser.fromJson1(json[i]);
      cvUser.index=i;
      tempListCvUser.add(cvUser);
    }
    return CvUsers(
      listCvUser: tempListCvUser,
    );
  }
  Map<String,dynamic> toJson1(){
    List<Map<String,dynamic>> tempListCvUser = [];
    for(CvUser cvUser in listCvUser){
      tempListCvUser.add(cvUser.toJson1());
    }
    return{
      'listCvUser':tempListCvUser,
    };
  }
}
class CvUser {
  int index;
  String idUser;
  String urlCv;
  PersonalInformation personalInformation;
  Educations educations;
  Languages languages;
  PersonalSkills personalSkills;
  Courses courses;
  WorkPlaces workPlaces;
  Projects projects;
  TechnicalSkills technicalSkills;

  CvUser({
     this.index=0,
     this.idUser='',
     this.urlCv='',
    required this.personalInformation,
    required this.educations,
    required this.languages,
    required this.personalSkills,
    required this.courses,
    required this.workPlaces,
    required this.projects,
    required this.technicalSkills,
  });

  factory CvUser.fromJson(json){

    return CvUser(
      index: json['index'],
      urlCv: json['urlCv']!=null?json['urlCv']:'',
      idUser:json.toString().contains('/CvUser/')?json.id:json['idUser'],
      personalInformation: PersonalInformation.fromJson(json['personalInformation']),
      educations: json['educations']!=null?Educations.fromJson(json['educations']):Educations(idUser: ''),
      languages: Languages.fromJson(json['languages']),
      personalSkills: PersonalSkills.fromJson(json['personalSkills']),
      courses: Courses.fromJson(json['courses']),
      workPlaces: WorkPlaces.fromJson(json['workPlaces']),
      projects: Projects.fromJson(json['projects']),
      technicalSkills: TechnicalSkills.fromJson(json['technicalSkills']),
    );
  }
  factory CvUser.fromJson1(json){

    return CvUser(
      index: json['index'],
      urlCv: json['urlCv']!=null?json['urlCv']:'',
      idUser:json.toString().contains('/CvUser/')?json.id:json['idUser'],
      personalInformation: PersonalInformation.fromJson(json['personalInformation']),
      educations: json['educations']!=null?Educations.fromJson1(json['educations']):Educations(idUser: ''),
      languages: Languages.fromJson(json['languages']),
      personalSkills: PersonalSkills.fromJson(json['personalSkills']),
      courses: Courses.fromJson1(json['courses']),
      workPlaces: WorkPlaces.fromJson1(json['workPlaces']),
      projects: Projects.fromJson1(json['projects']),
      technicalSkills: TechnicalSkills.fromJson(json['technicalSkills']),
    );
  }
  Map<String,dynamic> toJson1()=>{
    'index':index,
    'idUser':idUser,
    'urlCv':urlCv,
    'personalInformation':personalInformation.toJson(),
    'educations':educations.toJson1(),
    'languages':languages.toJson(),
    'personalSkills':personalSkills.toJson(),
    'courses':courses.toJson1(),
    'workPlaces':workPlaces.toJson1(),
    'projects':projects.toJson1(),
    'technicalSkills':technicalSkills.toJson(),
  };
  Map<String,dynamic> toJson()=>{
    'index':index,
    'idUser':idUser,
    'urlCv':urlCv,
    'personalInformation':personalInformation.toJson(),
    'educations':educations.toJson(),
    'languages':languages.toJson(),
    'personalSkills':personalSkills.toJson(),
    'courses':courses.toJson(),
    'workPlaces':workPlaces.toJson(),
    'projects':projects.toJson(),
    'technicalSkills':technicalSkills.toJson(),
  };
  factory CvUser.genCvUser(){
    return CvUser(
        personalInformation: PersonalInformation(name: '', email: '', phone: '', address: '', age: 0, gender: 'Male'),
        educations: Educations(idUser: '',listEducation: [
          Education.genCourse()
        ]),
        languages: Languages(idUser: '',listLanguage: [
          Language(name: '', level: 0)
        ]),
        personalSkills: PersonalSkills(idUser: '',listPersonalSkill: [
          PersonalSkill(name: '', level: 0)
        ]),
        courses: Courses(idUser: '',listCourse: [
          Course.genCourse(),
        ]),
        workPlaces: WorkPlaces(idUser: '',listWorkPlace: [
          WorkPlace.genCourse()
        ]),
        projects: Projects(idUser: '',listProject: [
          Project.genCourse()
        ]),
        technicalSkills: TechnicalSkills(idUser: '',listTechnicalSkill: [
          TechnicalSkill.genCourse()
        ]));
  }
  List values(){
    List tempList = [];
    tempList.addAll(projects.values());
    tempList.addAll(personalInformation.values());
    tempList.addAll(educations.values());
    tempList.addAll(languages.values());
    tempList.addAll(personalSkills.values());
    tempList.addAll(technicalSkills.values());
    tempList.addAll(courses.values());
    tempList.addAll(workPlaces.values());
    return tempList;
  }
  bool validate(){
    if(!projects.validate())
      return false;
    if(!personalInformation.validate())
      return false;
    if(!educations.validate())
      return false;
    if(!languages.validate())
      return false;
    if(!personalSkills.validate())
      return false;
    if(!technicalSkills.validate())
      return false;
    if(!courses.validate())
      return false;
    if(!workPlaces.validate())
      return false;
    return true;
  }

}

class PersonalInformation {
  String name;
  int age;
  String gender;
  String address;
  String email;
  String phone;
  bool militaryStatus;

  PersonalInformation({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.age,
    required this.gender,
    this.militaryStatus = false,
  });

  factory PersonalInformation.fromJson(json){
    return PersonalInformation(
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        address: json['address'],
        age: json['age'],
        gender: json['gender'],
        militaryStatus: json['militaryStatus'],);
  }
  Map<String,dynamic> toJson()=>{
    'name':name,
    'email':email,
    'phone':phone,
    'address':address,
    'age':age,
    'gender':gender,
    'militaryStatus':militaryStatus,
  };
  List values(){
    List tempList = toJson().values.toList();
    tempList.addAll(name.split(' '));
    tempList.addAll(address.split(' '));
    return tempList;
  }
  bool validate(){
    if(toJson().values.toList().contains(''))
      return false;
    if(age<0)
      return false;
    return true;
  }
}


class Languages {
  String idUser;
  List<Language> listLanguage;

  Languages({
    required this.idUser,
    this.listLanguage=const []
  });

  factory Languages.fromJson(json){
    List<Language> tempListLanguage = [];

    for(var language in json["listLanguage"]){
      tempListLanguage.add(Language.fromJson(language));
    }
    return Languages(
      idUser: json['idUser'],
      listLanguage: tempListLanguage,
    );
  }
  Map<String,dynamic> toJson(){
    List<Map<String,dynamic>> tempListLanguage = [];
    for(Language language in listLanguage){
      tempListLanguage.add(language.toJson());
    }
    return{
    'idUser':idUser,
    'listLanguage':tempListLanguage,
  };
  }
  List values(){
    List tempList = [];
    for(var element in listLanguage){
      tempList.addAll(element.values());
    }
    return tempList;
  }
  bool validate(){
    for(var element in listLanguage){
      if(!element.validate())
        return false;
    }
    return true;
  }
}
class Language {
  String name;
  int level;

  Language({
    required this.name,
    required this.level,
  });

  factory Language.fromJson(json){
    return Language(
      name: json['name'],
      level: json['level'],
    );
  }
  Map<String,dynamic> toJson()=>{
    'name':name,
    'level':level,
  };
  List values(){
    return toJson().values.toList();
  }
  bool validate(){
    if(values().contains(''))
      return false;
    if(level<1)
      return false;
    return true;
  }
}
class PersonalSkills {
  String idUser;
  List<PersonalSkill> listPersonalSkill;

  PersonalSkills({
    required this.idUser,
    this.listPersonalSkill=const []
  });

  factory PersonalSkills.fromJson(json){
    List<PersonalSkill> tempListPersonalSkill = [];
    for(var personalSkill in json["listPersonalSkill"]){
      tempListPersonalSkill.add(PersonalSkill.fromJson(personalSkill));
    }
    return PersonalSkills(
      idUser: json['idUser'],
      listPersonalSkill: tempListPersonalSkill,
    );
  }

  Map<String,dynamic> toJson(){
    List<Map<String,dynamic>> tempListPersonalSkill = [];
    for(PersonalSkill personalSkill in listPersonalSkill){
      tempListPersonalSkill.add(personalSkill.toJson());
    }
    return{
      'idUser':idUser,
      'listPersonalSkill':tempListPersonalSkill,
    };
  }
  List values(){
    List tempList = [];
    for(var element in listPersonalSkill){
      tempList.addAll(element.values());
    }
    return tempList;
  }
  bool validate(){
    for(var element in listPersonalSkill){
      if(!element.validate())
        return false;
    }
    return true;
  }
}
class PersonalSkill{
  String name;
  int level;

  PersonalSkill({
    required this.name,
    required this.level,
  });

  factory PersonalSkill.fromJson(json){
    return PersonalSkill(
      name: json['name'],
      level: json['level'],
    );
  }
  Map<String,dynamic> toJson()=>{
    'name':name,
    'level':level,
  };
  List values(){
    List tempList = toJson().values.toList();
    tempList.addAll(name.split(' '));
    return tempList;
  }
  bool validate(){
    if(values().contains(''))
      return false;
    if(level<1)
      return false;
    return true;
  }
}
class Courses {
  String idUser;
  List<Course> listCourse;

  Courses({
    required this.idUser,
    this.listCourse=const []
  });

  factory Courses.fromJson(json){
    List<Course> tempListCourse = [];
    for(var course in json["listCourse"]){
      tempListCourse.add(Course.fromJson(course));
    }
    return Courses(
      idUser: json['idUser'],
      listCourse: tempListCourse,
    );
  }
  factory Courses.fromJson1(json){
    List<Course> tempListCourse = [];
    for(var course in json["listCourse"]){
      tempListCourse.add(Course.fromJson1(course));
    }
    return Courses(
      idUser: json['idUser'],
      listCourse: tempListCourse,
    );
  }
  Map<String,dynamic> toJson1(){
    List<Map<String,dynamic>> tempListCourse = [];
    for(Course course in listCourse){
      tempListCourse.add(course.toJson1());
    }
    return{
      'idUser':idUser,
      'listCourse':tempListCourse,
    };
  }
  Map<String,dynamic> toJson(){
    List<Map<String,dynamic>> tempListCourse = [];
    for(Course course in listCourse){
      tempListCourse.add(course.toJson());
    }
    return{
      'idUser':idUser,
      'listCourse':tempListCourse,
    };
  }
  List values(){
    List tempList = [];
    for(var element in listCourse){
      tempList.addAll(element.values());
    }
    return tempList;
  }
  bool validate(){
    for(var element in listCourse){
      if(!element.validate())
        return false;
    }
    return true;
  }
}
class Course{
  String name;
  int level;
  DateTime date;
  String description;
  String certificateName;
  String certificateSide;
  String certificateType;

  Course({
    required this.name,
    required this.level,
    required this.description,
    required this.certificateName,
    required this.certificateSide,
    required this.certificateType,
    required this.date,
  });

  factory Course.fromJson(json){

   // Timestamp timestamp=json['date'] as Timestamp;
  //  print(json['date']);

    return Course(
      name: json['name'],
      level: json['level'],
      description: json['description'],
      certificateType: json['certificateType'],
      certificateSide: json['certificateSide'],
      certificateName: json['certificateName'],
      date: json['date'],
    );
  }
  factory Course.fromJson1(json){
    Course course=Course(
      name: json['name'],
      level: json['level'],
      description: json['description'],
      certificateType: json['certificateType'],
      certificateSide: json['certificateSide'],
      certificateName: json['certificateName'],
      date: DateTime.parse(json['date'] as String),
    );
    return course;
  }
  Map<String,dynamic> toJson1(){
    Map<String,dynamic> map=toJson();
    map['date']=date.toIso8601String();
   return map;
  }
  Map<String,dynamic> toJson()=>{
    'name':name,
    'level':level,
    'description':description,
    'certificateName':certificateName,
    'certificateType':certificateType,
    'certificateSide':certificateSide,
    'date':date,
  };
  factory Course.genCourse(){
    return  Course(name: '', level: 0, description: '', certificateName: '', certificateSide: '', certificateType: '', date: DateTime.utc(1));
  }
  List values(){
    List tempList =[];// toJson().values.toList();
    tempList.addAll(name.split(' '));
    tempList.addAll(certificateName.split(' '));
    tempList.add(date);
    tempList.addAll(certificateType.split(' '));
    tempList.addAll(certificateSide.split(' '));
    return tempList;
  }
  bool validate(){
     if(values().contains('')&&!values().contains(''))
       return false;
    
    // if(values().contains(''))
    //   return false;
    // if(date.year<2)
    //   return false;
    return true;
  }
}

class WorkPlaces {
  String idUser;
  List<WorkPlace> listWorkPlace;

  WorkPlaces({
    required this.idUser,
    this.listWorkPlace=const []
  });

  factory WorkPlaces.fromJson(json){
    List<WorkPlace> tempListWorkPlace = [];
    for(var workPlace in json["listWorkPlace"]){
      tempListWorkPlace.add(WorkPlace.fromJson(workPlace));
    }
    return WorkPlaces(
      idUser: json['idUser'],
      listWorkPlace: tempListWorkPlace,
    );
  }
  factory WorkPlaces.fromJson1(json){
    List<WorkPlace> tempListWorkPlace = [];
    for(var workPlace in json["listWorkPlace"]){
      tempListWorkPlace.add(WorkPlace.fromJson1(workPlace));
    }
    return WorkPlaces(
      idUser: json['idUser'],
      listWorkPlace: tempListWorkPlace,
    );
  }

  Map<String,dynamic> toJson1(){
    List<Map<String,dynamic>> tempListWorkPlace = [];
    for(WorkPlace workPlace in listWorkPlace){
      tempListWorkPlace.add(workPlace.toJson1());
    }
    return{
      'idUser':idUser,
      'listWorkPlace':tempListWorkPlace,
    };
  }
  Map<String,dynamic> toJson(){
    List<Map<String,dynamic>> tempListWorkPlace = [];
    for(WorkPlace workPlace in listWorkPlace){
      tempListWorkPlace.add(workPlace.toJson());
    }
    return{
      'idUser':idUser,
      'listWorkPlace':tempListWorkPlace,
    };
  }
  List values(){
    List tempList = [];
    for(var element in listWorkPlace){
      tempList.addAll(element.values());
    }
    return tempList;
  }
  bool validate(){
    for(var element in listWorkPlace){
      if(!element.validate())
        return false;
    }
    return true;
  }
}
class WorkPlace{
  String nameWorkPlace;
  String companyWorkPlace;
  String contactInfo;
  String emailCompany;
  String phoneCompany;
  String workType;
  DateTime startDate;
  DateTime endDate;
  bool endDateForNow;
  Works works;

  WorkPlace({
    required this.nameWorkPlace,
    required this.companyWorkPlace,
    required this.contactInfo,
    required this.emailCompany,
    required this.phoneCompany,
    required this.workType,
    required this.works,
    required this.startDate,
    required this.endDate,
    this.endDateForNow=false,
  });

  factory WorkPlace.fromJson(json){
    return WorkPlace(
      nameWorkPlace: json['nameWorkPlace'],
      companyWorkPlace: json['companyWorkPlace'],
      contactInfo: json['contactInfo'],
      emailCompany: json['emailCompany'],
      phoneCompany: json['phoneCompany'],
      workType: json['workType'],
      works: Works.fromJson(json['listWorkPlace']),
      endDateForNow: json['endDateForNow'],
      startDate: json['startDate'],
      endDate: json['endDate'],
    );
  }
  factory WorkPlace.fromJson1(json){
    WorkPlace workPlace=WorkPlace(
      nameWorkPlace: json['nameWorkPlace'],
      companyWorkPlace: json['companyWorkPlace'],
      contactInfo: json['contactInfo'],
      emailCompany: json['emailCompany'],
      phoneCompany: json['phoneCompany'],
      workType: json['workType'],
      works: Works.fromJson1(json['listWorkPlace']),
      endDateForNow: json['endDateForNow'],
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
    );
    return workPlace;
  }
  Map<String,dynamic> toJson1(){
    Map<String,dynamic> map=toJson();
    map['startDate']=startDate.toIso8601String();
    map['endDate']=endDate.toIso8601String();
    map['listWorkPlace']=works.toJson1();
    return map;
  }
  Map<String,dynamic> toJson() {
    return {
      'nameWorkPlace': nameWorkPlace,
      'companyWorkPlace': companyWorkPlace,
      'contactInfo': contactInfo,
      'emailCompany': emailCompany,
      'phoneCompany': phoneCompany,
      'workType': workType,
      'listWorkPlace':works.toJson(),
      'endDateForNow': endDateForNow,
      'endDate': endDate,
      'startDate': startDate,
    };
  }
  factory WorkPlace.genCourse(){
    return  WorkPlace(nameWorkPlace: '', companyWorkPlace: '', contactInfo: '', emailCompany: '',works: Works(idUser: '', idWorkPlace: '',listWork: [Work.genCourse()]), phoneCompany: '', workType: '', startDate: DateTime.utc(1), endDate: DateTime.utc(1));
  }
  List values(){
    List tempList = valuesWorkPlace();
    tempList.addAll(works.values());
    return tempList;
  }
  List valuesWorkPlace(){
    List tempList = [];
    for(var key in toJson().keys){
      if(!key.contains('listWorkPlace')){
        tempList.add(toJson()[key]);
        tempList.addAll(toJson()[key].toString().split(' '));
      }
    }
    return tempList;
  }
  bool validate(){
     if(!values().contains('')&&values().contains(''))
       return false;
     if(!works.validate())
       return false;
    // if(values().contains(''))
    //   return false;
    // if(startDate.year<2)
    //   return false;
    // if(!works.validate())
    //   return false;
    return true;
  }
}

class Works {
  String idUser;
  String idWorkPlace;
  List<Work> listWork;

  Works({
    required this.idUser,
    required this.idWorkPlace,
    this.listWork=const []
  });

  factory Works.fromJson(json){
    List<Work> tempListWork = [];
    for(var work in json["listWork"]){

      tempListWork.add(Work.fromJson(work));
    }
    return Works(
      idUser: json['idUser'],
      idWorkPlace: json['idWorkPlace'],
      listWork: tempListWork,
    );
  }
  factory Works.fromJson1(json){
    List<Work> tempListWork = [];
    for(var work in json["listWork"]){

      tempListWork.add(Work.fromJson1(work));
    }
    return Works(
      idUser: json['idUser'],
      idWorkPlace: json['idWorkPlace'],
      listWork: tempListWork,
    );
  }
  Map<String,dynamic> toJson1(){
    List<Map<String,dynamic>> tempListWork = [];
    for(Work work in listWork){
      tempListWork.add(work.toJson1());
    }
    return{
      'idUser':idUser,
      'idWorkPlace':idWorkPlace,
      'listWork':tempListWork,
    };
  }
  Map<String,dynamic> toJson(){
    List<Map<String,dynamic>> tempListWork = [];
    for(Work work in listWork){
      tempListWork.add(work.toJson());
    }
    return{
      'idUser':idUser,
      'idWorkPlace':idWorkPlace,
      'listWork':tempListWork,
    };
  }
  List values(){
    List tempList = [];
    for(var element in listWork){
      tempList.addAll(element.values());
    }
    return tempList;
  }
  bool validate(){
    for(var element in listWork){
      if(!element.validate())
        return false;
    }
    return true;
  }
}
class Work{
  String positionPersonPlace;
  DateTime startDate;
  DateTime endDate;
  bool endDateForNow;
  String experienceWork;
  String skillsPersonPlace;

  Work({
    required this.positionPersonPlace,
    required this.skillsPersonPlace,
    required this.experienceWork,
    required this.startDate,
    required this.endDate,
     this.endDateForNow=false,
  });

  factory Work.fromJson(json){
    return Work(
      positionPersonPlace: json['positionPersonPlace'],
      experienceWork: json['experienceWork'],
      skillsPersonPlace: json['skillsPersonPlace'],
      endDateForNow: json['endDateForNow'],
      startDate: json['startDate'],
      endDate: json['endDate'],
    );
  }
  factory Work.fromJson1(json){
    Work work=Work(
      positionPersonPlace: json['positionPersonPlace'],
      experienceWork: json['experienceWork'],
      skillsPersonPlace: json['skillsPersonPlace'],
      endDateForNow: json['endDateForNow'],
      startDate:DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
    );
    return work;
  }
  Map<String,dynamic> toJson1(){
    Map<String,dynamic> map=toJson();
    map['startDate']=startDate.toIso8601String();
    map['endDate']=endDate.toIso8601String();
    return map;
  }
  Map<String,dynamic> toJson()=>{
    'positionPersonPlace':positionPersonPlace,
    'experienceWork':experienceWork,
    'skillsPersonPlace':skillsPersonPlace,
    'endDateForNow':endDateForNow,
    'endDate':endDate,
    'startDate':startDate,
  };
  factory Work.genCourse(){
    return Work(positionPersonPlace: '', skillsPersonPlace: '', experienceWork: '', startDate: DateTime.utc(1), endDate: DateTime.utc(1));
  }

  List values(){
    List tempList = toJson().values.toList();
    tempList.addAll(positionPersonPlace.split(' '));
    tempList.addAll(experienceWork.split(' '));
    tempList.addAll(skillsPersonPlace.split(' '));
    tempList.add(endDateForNow);
    tempList.add(startDate);
    tempList.add(endDate);
    return tempList;
  }
  bool validate(){
     if(values().contains('')&&!values().contains(''))
       return false;
    // if(values().contains(''))
    //   return false;
    // if(startDate.year<2)
    //   return false;
    return true;
  }
}

class Educations {
  String idUser;
  List<Education> listEducation;

  Educations({
    required this.idUser,
    this.listEducation=const []
  });

  factory Educations.fromJson(json){
    List<Education> tempListEducation = [];
    for(var education in json["listEducation"]){

      tempListEducation.add(Education.fromJson(education));
    }
    return Educations(
      idUser: json['idUser'],
      listEducation: tempListEducation,
    );
  }
  factory Educations.fromJson1(json){
    List<Education> tempListEducation = [];
    for(var education in json["listEducation"]){

      tempListEducation.add(Education.fromJson1(education));
    }
    return Educations(
      idUser: json['idUser'],
      listEducation: tempListEducation,
    );
  }
  Map<String,dynamic> toJson1(){
    List<Map<String,dynamic>> tempListEducation= [];
    for(Education education in listEducation){
      tempListEducation.add(education.toJson1());
    }
    return{
      'idUser':idUser,
      'listEducation':tempListEducation,
    };
  }
  Map<String,dynamic> toJson(){
    List<Map<String,dynamic>> tempListEducation= [];
    for(Education education in listEducation){
      tempListEducation.add(education.toJson());
    }
    return{
      'idUser':idUser,
      'listEducation':tempListEducation,
    };
  }
  List values(){
    List tempList = [];
    for(var element in listEducation){
      tempList.addAll(element.values());
    }
    return tempList;
  }
  bool validate(){
    for(var element in listEducation){
      if(!element.validate())
        return false;
    }
    return true;
  }
}
class Education{
  String educationStatus;
  DateTime startDate;
  DateTime endDate;
  bool endDateForNow;
  String educationYear;
  String educationPlace;

  Education({
    required this.educationPlace,
    required this.educationStatus,
    required this.educationYear,
    required this.startDate,
    required this.endDate,
    this.endDateForNow=false,
  });

  factory Education.fromJson(json){
    return Education(
      educationYear: json['educationYear'],
      educationStatus: json['educationStatus'],
      educationPlace: json['educationPlace'],
      endDateForNow: json['endDateForNow'],
      startDate: json['startDate'],
      endDate: json['endDate'],
    );
  }
  factory Education.fromJson1(json){
    Education education=Education(
      educationYear: json['educationYear'],
      educationStatus: json['educationStatus'],
      educationPlace: json['educationPlace'],
      endDateForNow: json['endDateForNow'],
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
    );
    return education;
  }
  Map<String,dynamic> toJson1(){
    Map<String,dynamic> map=toJson();
    map['startDate']=startDate.toIso8601String();
    map['endDate']=endDate.toIso8601String();
    return map;
  }
  Map<String,dynamic> toJson()=>{
    'educationYear':educationYear,
    'educationStatus':educationStatus,
    'educationPlace':educationPlace,
    'endDateForNow':endDateForNow,
    'endDate':endDate,
    'startDate':startDate,
  };
  factory Education.genCourse(){
    return Education(educationYear: '', educationStatus: '', educationPlace: '', startDate: DateTime.utc(1), endDate: DateTime.utc(1));
  }
  List values(){
    List tempList = toJson().values.toList();
    tempList.addAll(educationStatus.split(' '));
    tempList.addAll(educationYear.split(' '));
    tempList.addAll(educationPlace.split(' '));
    return tempList;
  }
  bool validate(){
    if(toJson().values.toList().contains(''))
      return false;
    if(startDate.year<2)
      return false;
    return true;
  }
}

class Projects {
  String idUser;
  List<Project> listProject;

  Projects({
    required this.idUser,
    this.listProject=const []
  });

  factory Projects.fromJson(json){
    List<Project> tempListProject= [];
    for(var project in json["listProject"]){
      tempListProject.add(Project.fromJson(project));
    }
    return Projects(
      idUser: json['idUser'],
      listProject: tempListProject,
    );
  }
  factory Projects.fromJson1(json){
    List<Project> tempListProject= [];
    for(var project in json["listProject"]){
      tempListProject.add(Project.fromJson1(project));
    }
    return Projects(
      idUser: json['idUser'],
      listProject: tempListProject,
    );
  }
  Map<String,dynamic> toJson1(){
    List<Map<String,dynamic>> tempListProject = [];
    for(Project project in listProject){
      tempListProject.add(project.toJson1());
    }
    return{
      'idUser':idUser,
      'listProject':tempListProject,
    };
  }
  Map<String,dynamic> toJson(){
    List<Map<String,dynamic>> tempListProject = [];
    for(Project project in listProject){
      tempListProject.add(project.toJson());
    }
    return{
      'idUser':idUser,
      'listProject':tempListProject,
    };
  }
  List values(){
    List tempList = [];
    for(var element in listProject){
      tempList.addAll(element.values());
    }
    return tempList;
  }
  bool validate(){
    for(var element in listProject){
      if(!element.validate())
        return false;
    }
    return true;
  }
}
class Project{
  String nameProject;
  String typeProject;
  String descriptionProject;
  String linkProject;
  String stakeholder;
  DateTime startDate;
  DateTime endDate;
  bool endDateForNow;

  Project({
    required this.nameProject,
    required this.typeProject,
    required this.descriptionProject,
    required this.linkProject,
     this.stakeholder="T",
    required this.startDate,
    required this.endDate,
    this.endDateForNow=false,
  });

  factory Project.fromJson(json){
    return Project(
      nameProject: json['nameProject'],
      typeProject: json['typeProject'],
      descriptionProject: json['descriptionProject'],
      linkProject: json['linkProject'],
      stakeholder: json['stakeholder'],
      endDateForNow: json['endDateForNow'],
      startDate: json['startDate'],
      endDate: json['endDate'],
    );
  }
  factory Project.fromJson1(json){
    Project project=Project(
      nameProject: json['nameProject'],
      typeProject: json['typeProject'],
      descriptionProject: json['descriptionProject'],
      linkProject: json['linkProject'],
      stakeholder: json['stakeholder'],
      endDateForNow: json['endDateForNow'],
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
    );
    return project;
  }
  Map<String,dynamic> toJson1(){
    Map<String,dynamic> map=toJson();
    map['startDate']=startDate.toIso8601String();
    map['endDate']=endDate.toIso8601String();
    return map;
  }
  Map<String,dynamic> toJson()=>{
    'nameProject':nameProject,
    'typeProject':typeProject,
    'descriptionProject':descriptionProject,
    'linkProject':linkProject,
    'stakeholder':stakeholder,
    'endDateForNow':endDateForNow,
    'endDate':endDate,
    'startDate':startDate,
  };
  factory Project.genCourse(){
    return Project(nameProject: '', typeProject: '', descriptionProject: '', linkProject: '', stakeholder: 't', startDate: DateTime.utc(1), endDate: DateTime.utc(1));
  }
  List values(){
    this.stakeholder="T";
    return toJson().values.toList();
  }
  bool validate(){
    // if(values().contains(''))
    //   return false;
    // if(startDate.year<2)
    //   return false;
    return true;
  }

}

class TechnicalSkills {
  String idUser;
  List<TechnicalSkill> listTechnicalSkill;

  TechnicalSkills({
    required this.idUser,
    this.listTechnicalSkill=const []
  });

  factory TechnicalSkills.fromJson(json){
    List<TechnicalSkill> tempListTechnicalSkill= [];
    for(var technicalSkill in json["listTechnicalSkill"]){
      tempListTechnicalSkill.add(TechnicalSkill.fromJson(technicalSkill));
    }
    return TechnicalSkills(
      idUser: json['idUser'],
      listTechnicalSkill: tempListTechnicalSkill,
    );
  }
  Map<String,dynamic> toJson(){
    List<Map<String,dynamic>> tempListTechnicalSkill = [];
    for(TechnicalSkill technicalSkill in listTechnicalSkill){
      tempListTechnicalSkill.add(technicalSkill.toJson());
    }
    return{
      'idUser':idUser,
      'listTechnicalSkill':tempListTechnicalSkill,
    };
  }
  List values(){
    List tempListTechnicalSkill = [];
    for(TechnicalSkill technicalSkill in listTechnicalSkill){
      tempListTechnicalSkill.addAll(technicalSkill.toJson().values);
    }
    return tempListTechnicalSkill;
  }
  bool validate(){
    for(var element in listTechnicalSkill){
      if(!element.validate())
         return false;
    }
    return true;
  }
}
class TechnicalSkill{
  String skillsType;
  String skillsName;
  String skillsLevel;

  TechnicalSkill({
    required this.skillsType,
    required this.skillsName,
    required this.skillsLevel,
  });

  factory TechnicalSkill.fromJson(json){
    return TechnicalSkill(
      skillsType: json['skillsType'],
      skillsName:json['skillsName'],
      skillsLevel: '${json['skillsLevel']}',
    );
  }
  Map<String,dynamic> toJson()=>{
    'skillsType':skillsType,
    'skillsName':skillsName,
    'skillsLevel':skillsLevel,
  };
  factory TechnicalSkill.genCourse(){
    return TechnicalSkill(skillsType: '', skillsName: '', skillsLevel: '');
  }
  List values(){
    List tempList = toJson().values.toList();
    tempList.addAll(skillsLevel.split(' '));
    tempList.addAll(skillsName.split(' '));
    tempList.addAll(skillsType.split(' '));
    return tempList;
  }
  bool validate(){
    if(toJson().values.toList().contains(''))
      return false;
    return true;
  }
}
class UserLearn{
  String name;
  UserLearn({required this.name});
}
/*
flutter pub run easy_localization:generate -S "assets/translations/" -O "lib/translations"
flutter pub run easy_localization:generate -S "assets/translations/" -O "lib/translations" -o "locale_keys.g.dart" -f keys
flutter build apk --split-per-abi
temp@gmail.com   123456
 */
