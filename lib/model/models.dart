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
}
class CvUser {
  int index;
  String idUser;
  String urlCv;
  PersonalInformation personalInformation;
  Learns learns;
  Languages languages;
  Skills skills;
  Courses courses;
  WorkPlaces workPlaces;
  Projects projects;
  TechnicalSkills technicalSkills;

  CvUser({
     this.index=0,
     this.idUser='',
     this.urlCv='',
    required this.personalInformation,
    required this.learns,
    required this.languages,
    required this.skills,
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
      learns: json['learns']!=null?Learns.fromJson(json['learns']):Learns(idUser: ''),
      languages: Languages.fromJson(json['languages']),
      skills: Skills.fromJson(json['skills']),
      courses: Courses.fromJson(json['courses']),
      workPlaces: WorkPlaces.fromJson(json['workPlaces']),
      projects: Projects.fromJson(json['projects']),
      technicalSkills: TechnicalSkills.fromJson(json['technicalSkills']),
    );
  }
  Map<String,dynamic> toJson()=>{
    'index':index,
    'idUser':idUser,
    'urlCv':urlCv,
    'personalInformation':personalInformation.toJson(),
    'learns':learns.toJson(),
    'languages':languages.toJson(),
    'skills':skills.toJson(),
    'courses':courses.toJson(),
    'workPlaces':workPlaces.toJson(),
    'projects':projects.toJson(),
    'technicalSkills':technicalSkills.toJson(),
  };
  factory CvUser.genCvUser(){
    return CvUser(
        personalInformation: PersonalInformation(name: '', email: '', phone: '', address: '', age: 0, gender: ''),
        learns: Learns(idUser: '',listLearn: [
          Learn.genCourse()
        ]),
        languages: Languages(idUser: '',listLanguage: [
          Language(name: '', level: 0)
        ]),
        skills: Skills(idUser: '',listSkill: [
          Skill(name: '', level: 0)
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
    tempList.addAll(learns.values());
    tempList.addAll(languages.values());
    tempList.addAll(skills.values());
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
    if(!learns.validate())
      return false;
    if(!languages.validate())
      return false;
    if(!skills.validate())
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
    if(values().contains(''))
      return false;
    if(age<1)
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
class Skills {
  String idUser;
  List<Skill> listSkill;

  Skills({
    required this.idUser,
    this.listSkill=const []
  });

  factory Skills.fromJson(json){
    List<Skill> tempListSkill = [];
    for(var skill in json["listSkill"]){
      tempListSkill.add(Skill.fromJson(skill));
    }
    return Skills(
      idUser: json['idUser'],
      listSkill: tempListSkill,
    );
  }
  Map<String,dynamic> toJson(){
    List<Map<String,dynamic>> tempListSkill = [];
    for(Skill skill in listSkill){
      tempListSkill.add(skill.toJson());
    }
    return{
      'idUser':idUser,
      'listSkill':tempListSkill,
    };
  }
  List values(){
    List tempList = [];
    for(var element in listSkill){
      tempList.addAll(element.values());
    }
    return tempList;
  }
  bool validate(){
    for(var element in listSkill){
      if(!element.validate())
        return false;
    }
    return true;
  }
}
class Skill{
  String name;
  int level;

Skill({
    required this.name,
    required this.level,
  });

  factory Skill.fromJson(json){
    return Skill(
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
    if(values().contains(''))
      return false;
    if(date.year<2)
      return false;
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
    if(values().contains(''))
      return false;
    if(startDate.year<2)
      return false;
    if(!works.validate())
      return false;
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
  String levelPersonPlace;
  String skillsPersonPlace;

  Work({
    required this.positionPersonPlace,
    required this.skillsPersonPlace,
    required this.levelPersonPlace,
    required this.startDate,
    required this.endDate,
     this.endDateForNow=false,
  });

  factory Work.fromJson(json){
    return Work(
      positionPersonPlace: json['positionPersonPlace'],
      levelPersonPlace: json['levelPersonPlace'],
      skillsPersonPlace: json['skillsPersonPlace'],
      endDateForNow: json['endDateForNow'],
      startDate: json['startDate'],
      endDate: json['endDate'],
    );
  }
  Map<String,dynamic> toJson()=>{
    'positionPersonPlace':positionPersonPlace,
    'levelPersonPlace':levelPersonPlace,
    'skillsPersonPlace':skillsPersonPlace,
    'endDateForNow':endDateForNow,
    'endDate':endDate,
    'startDate':startDate,
  };
  factory Work.genCourse(){
    return Work(positionPersonPlace: '', skillsPersonPlace: '', levelPersonPlace: '', startDate: DateTime.utc(1), endDate: DateTime.utc(1));
  }

  List values(){
    List tempList = toJson().values.toList();
    tempList.addAll(positionPersonPlace.split(' '));
    tempList.addAll(levelPersonPlace.split(' '));
    tempList.addAll(skillsPersonPlace.split(' '));
    tempList.add(endDateForNow);
    tempList.add(startDate);
    tempList.add(endDate);
    return tempList;
  }
  bool validate(){
    if(values().contains(''))
      return false;
    if(startDate.year<2)
      return false;
    return true;
  }
}

class Learns {
  String idUser;
  List<Learn> listLearn;

  Learns({
    required this.idUser,
    this.listLearn=const []
  });

  factory Learns.fromJson(json){
    List<Learn> tempListLearn = [];
    for(var learn in json["listLearn"]){

      tempListLearn.add(Learn.fromJson(learn));
    }
    return Learns(
      idUser: json['idUser'],
      listLearn: tempListLearn,
    );
  }
  Map<String,dynamic> toJson(){
    List<Map<String,dynamic>> tempListLearn= [];
    for(Learn learn in listLearn){
      tempListLearn.add(learn.toJson());
    }
    return{
      'idUser':idUser,
      'listLearn':tempListLearn,
    };
  }
  List values(){
    List tempList = [];
    for(var element in listLearn){
      tempList.addAll(element.values());
    }
    return tempList;
  }
  bool validate(){
    for(var element in listLearn){
      if(!element.validate())
        return false;
    }
    return true;
  }
}
class Learn{
  String state;
  DateTime startDate;
  DateTime endDate;
  bool endDateForNow;
  String learnYear;
  String nameUniversity;

  Learn({
    required this.nameUniversity,
    required this.state,
    required this.learnYear,
    required this.startDate,
    required this.endDate,
    this.endDateForNow=false,
  });

  factory Learn.fromJson(json){
    return Learn(
      learnYear: json['learnYear'],
      state: json['state'],
      nameUniversity: json['nameUniversity'],
      endDateForNow: json['endDateForNow'],
      startDate: json['startDate'],
      endDate: json['endDate'],
    );
  }
  Map<String,dynamic> toJson()=>{
    'learnYear':learnYear,
    'state':state,
    'nameUniversity':nameUniversity,
    'endDateForNow':endDateForNow,
    'endDate':endDate,
    'startDate':startDate,
  };
  factory Learn.genCourse(){
    return Learn(learnYear: '', state: '', nameUniversity: '', startDate: DateTime.utc(1), endDate: DateTime.utc(1));
  }
  List values(){
    List tempList = toJson().values.toList();
    tempList.addAll(state.split(' '));
    tempList.addAll(learnYear.split(' '));
    tempList.addAll(nameUniversity.split(' '));
    return tempList;
  }
  bool validate(){
    if(values().contains(''))
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
    required this.stakeholder,
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
    return Project(nameProject: '', typeProject: '', descriptionProject: '', linkProject: '', stakeholder: '', startDate: DateTime.utc(1), endDate: DateTime.utc(1));
  }
  List values(){
    return toJson().values.toList();
  }
  bool validate(){
    if(values().contains(''))
      return false;
    if(startDate.year<2)
      return false;
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
    if(values().contains(''))
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
