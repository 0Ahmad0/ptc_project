import 'package:firedart/auth/user_gateway.dart';

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


class CvUser {
  String idUser;
  PersonalInformation personalInformation;
  Languages languages;
  Skills skills;
  Courses courses;
  WorkPlaces workPlaces;
  Projects projects;
  TechnicalSkills technicalSkills;

  CvUser({
     this.idUser='',
    required this.personalInformation,
    required this.languages,
    required this.skills,
    required this.courses,
    required this.workPlaces,
    required this.projects,
    required this.technicalSkills,
  });

  factory CvUser.fromJson(json){
    return CvUser(
      idUser:json['idUser'],
      personalInformation: PersonalInformation.fromJson(json['personalInformation']),
      languages: Languages.fromJson(json['languages']),
      skills: Skills.fromJson(json['skills']),
      courses: Courses.fromJson(json['courses']),
      workPlaces: WorkPlaces.fromJson(json['workPlaces']),
      projects: Projects.fromJson(json['projects']),
      technicalSkills: TechnicalSkills.fromJson(json['technicalSkills']),
    );
  }
  Map<String,dynamic> toJson()=>{
    'idUser':idUser,
    'personalInformation':personalInformation.toJson(),
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
        languages: Languages(idUser: '',listLanguage: [
          Language(name: '', level: 0)
        ]),
        skills: Skills(idUser: '',listSkill: [
          Skill(name: '', level: 0)
        ]),
        courses: Courses(idUser: '',listCourse: [
          Course.genCourse(),
        ]),
        workPlaces: WorkPlaces(idUser: '',listWorkPlace: []),
        projects: Projects(idUser: '',listProject: []),
        technicalSkills: TechnicalSkills(idUser: '',listTechnicalSkill: []));
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
    for(Language language in json["listLanguage"]){
      tempListLanguage.add(language);
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
    for(Skill skill in json["listSkill"]){
      tempListSkill.add(skill);
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
    for(Course course in json["listCourse"]){
      tempListCourse.add(course);
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
    return  Course(name: '', level: 0, description: '', certificateName: '', certificateSide: '', certificateType: '', date: DateTime.utc(0));
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
    for(WorkPlace workPlace in json["listWorkPlace"]){
      tempListWorkPlace.add(workPlace);
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
  List<WorkPlace> listWorkPlace;

  WorkPlace({
    required this.nameWorkPlace,
    required this.companyWorkPlace,
    required this.contactInfo,
    required this.emailCompany,
    required this.phoneCompany,
    required this.workType,
    this.listWorkPlace=const [],
    required this.startDate,
    required this.endDate,
    this.endDateForNow=false,
  });

  factory WorkPlace.fromJson(json){
    List<WorkPlace> tempListWorkPlace = [];
    for(WorkPlace workPlace in json["listWorkPlace"]){
      tempListWorkPlace.add(workPlace);
    }
    return WorkPlace(
      nameWorkPlace: json['nameWorkPlace'],
      companyWorkPlace: json['companyWorkPlace'],
      contactInfo: json['contactInfo'],
      emailCompany: json['emailCompany'],
      phoneCompany: json['phoneCompany'],
      workType: json['workType'],
      listWorkPlace: tempListWorkPlace,
      endDateForNow: json['endDateForNow'],
      startDate: json['startDate'],
      endDate: json['endDate'],
    );
  }
  Map<String,dynamic> toJson() {
    List<Map<String,dynamic>> tempListWorkPlace = [];
    for(WorkPlace  workPlace in listWorkPlace){
      tempListWorkPlace.add(workPlace.toJson());
    }
    return {
      'nameWorkPlace': nameWorkPlace,
      'companyWorkPlace': companyWorkPlace,
      'contactInfo': contactInfo,
      'emailCompany': emailCompany,
      'phoneCompany': phoneCompany,
      'workType': workType,
      'listWorkPlace':tempListWorkPlace,
      'endDateForNow': endDateForNow,
      'endDate': endDate,
      'startDate': startDate,
    };
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
    for(Work work in json["listWork"]){
      tempListWork.add(work);
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
    for(Project project in json["listProject"]){
      tempListProject.add(project);
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
    for(TechnicalSkill technicalSkill in json["listTechnicalSkill"]){
      tempListTechnicalSkill.add(technicalSkill);
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
}
class TechnicalSkill{
  String skillsType;
  String skillsName;
  int skillsLevel;

  TechnicalSkill({
    required this.skillsType,
    required this.skillsName,
    required this.skillsLevel,
  });

  factory TechnicalSkill.fromJson(json){
    return TechnicalSkill(
      skillsType: json['skillsType'],
      skillsName:json['skillsName'],
      skillsLevel: json['skillsLevel'],
    );
  }
  Map<String,dynamic> toJson()=>{
    'skillsType':skillsType,
    'skillsName':skillsName,
    'skillsLevel':skillsLevel,
  };
}
/*
flutter pub run easy_localization:generate -S "assets/translations/" -O "lib/translations"
flutter pub run easy_localization:generate -S "assets/translations/" -O "lib/translations" -o "locale_keys.g.dart" -f keys
flutter build apk --split-per-abi
temp@gmail.com   123456
 */
