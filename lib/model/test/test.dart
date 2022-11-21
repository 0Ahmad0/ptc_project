import 'package:ptc_project/model/models.dart';

class TestModel {
  static WorkPlaces workPlaces = WorkPlaces(idUser: '', listWorkPlace: [
    WorkPlace(
        nameWorkPlace: 'nameWorkPlace1',
        companyWorkPlace: 'companyWorkPlace1',
        contactInfo: 'contactInfo1',
        emailCompany: 'emailCompany1',
        phoneCompany: 'phoneCompany1',
        workType: 'Internal',
        works: Works(idUser: '', idWorkPlace: '', listWork: [
          Work(
              positionPersonPlace: 'positionPersonPlace1',
              skillsPersonPlace: 'skillsPersonPlace1',
              levelPersonPlace: 'levelPersonPlace1',
              startDate: DateTime.utc(2020),
              endDate: DateTime.utc(2021),
              endDateForNow: true),
          Work(
              positionPersonPlace: 'positionPersonPlace2',
              skillsPersonPlace: 'skillsPersonPlace2',
              levelPersonPlace: 'levelPersonPlace2',
              startDate: DateTime.utc(2020),
              endDate: DateTime.utc(1))
        ]),
        startDate: DateTime.utc(2020),
        endDate: DateTime.utc(2021),
        endDateForNow: true),
    WorkPlace(
        nameWorkPlace: 'nameWorkPlace2',
        companyWorkPlace: 'companyWorkPlace2',
        contactInfo: 'contactInfo2',
        emailCompany: 'emailCompany2',
        phoneCompany: 'phoneCompany2',
        workType: 'Internal',
        works: Works(idUser: '', idWorkPlace: '', listWork: [
          Work(
              positionPersonPlace: 'positionPersonPlace1',
              skillsPersonPlace: 'skillsPersonPlace1',
              levelPersonPlace: 'levelPersonPlace1',
              startDate: DateTime.utc(2020),
              endDate: DateTime.utc(2021),
              endDateForNow: true),
          Work(
              positionPersonPlace: 'positionPersonPlace2',
              skillsPersonPlace: 'skillsPersonPlace2',
              levelPersonPlace: 'levelPersonPlace2',
              startDate: DateTime.utc(2020),
              endDate: DateTime.utc(1))
        ]),
        startDate: DateTime.utc(2020),
        endDate: DateTime.utc(2021),
        endDateForNow: true)
  ]);

  CvUser cvUser1 = CvUser(
      urlCv: 'https://www.youtube.com/watch?v=LvylCaKYNZ0',
      personalInformation: PersonalInformation(
          name: 'name1',
          email: 'email@gmail.com',
          phone: '0987654321',
          address: 'address1',
          age: 22,
          gender: 'Male'),
      learns: Learns(listLearn: [
        Learn(
            nameUniversity: 'nameUniversity',
            state: 'state',
            learnYear: 'year',
            startDate: DateTime.utc(2021),
            endDate: DateTime.utc(1))
      ], idUser: ''),
      languages: Languages(idUser: '', listLanguage: [
        Language(name: 'name1', level: 5),
        Language(name: 'name2', level: 3)
      ]),
      skills: Skills(idUser: '', listSkill: [
        Skill(name: 'skill1', level: 4),
        Skill(name: 'Skill2', level: 2),
        Skill(name: 'Skill3', level: 1)
      ]),
      courses: Courses(idUser: '', listCourse: [
        Course(
            name: 'course1',
            level: 4,
            description: 'description description description description',
            certificateName: 'certificateName1',
            certificateSide: 'certificateSide1',
            certificateType: 'certificateType1',
            date: DateTime.utc(2021)),
        Course(
            name: 'course2',
            level: 5,
            description: 'description description description description',
            certificateName: 'certificateName2',
            certificateSide: 'certificateSide2',
            certificateType: 'certificateType2',
            date: DateTime.utc(2020)),
      ]),
      workPlaces: workPlaces,
      projects: Projects(idUser: '', listProject: [
        Project(
            nameProject: 'nameProject1',
            typeProject: 'typeProject1',
            descriptionProject: 'descriptionProject1',
            linkProject: 'linkProject1',
            stakeholder: 'stakeholder1',
            startDate: DateTime.utc(2020),
            endDate: DateTime.utc(1)),
        Project(
          nameProject: 'nameProject2',
          typeProject: 'typeProject2',
          descriptionProject: 'descriptionProject2',
          linkProject: 'linkProject2',
          stakeholder: 'stakeholder2',
          startDate: DateTime.utc(2020),
          endDate: DateTime.utc(2021),
          endDateForNow: true,
        )
      ]),
      technicalSkills: TechnicalSkills(idUser: '', listTechnicalSkill: [
        TechnicalSkill(
            skillsType: 'skillsType1',
            skillsName: 'skillsName1',
            skillsLevel: 'mid'),
        TechnicalSkill(
            skillsType: 'skillsType2',
            skillsName: 'skillsName2',
            skillsLevel: 'mid'),
        TechnicalSkill(
            skillsType: 'skillsType3',
            skillsName: 'skillsName3',
            skillsLevel: 'mid')
      ]));
}
