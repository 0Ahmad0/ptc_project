import 'package:flutter/material.dart';
import 'package:ptc_project/controller/home_controller.dart';
import 'package:ptc_project/view/resourse/color_manager.dart';
import 'package:ptc_project/view/resourse/values_manager.dart';
import 'package:ptc_project/view/widgets/courses_form.dart';
import 'package:ptc_project/view/widgets/language_form.dart';
import 'package:ptc_project/view/widgets/skils_form.dart';

import '../../model/models.dart';
import 'custom_divider.dart';

class MultiFormLan extends StatefulWidget {
  const MultiFormLan({Key? key}) : super(key: key);

  @override
  State<MultiFormLan> createState() => _MultiFormLanState();
}

class _MultiFormLanState extends State<MultiFormLan> {
  List<UserLanguage> userLanguage = [
    UserLanguage()
  ];
  List<UserSkils> userSkils = [
    UserSkils()
  ];
  List<UserCourses> userCourses = [
    UserCourses()
  ];
  @override
  Widget build(BuildContext context) {
    return
      //userLanguage.isEmpty?Center(child: Text("No Data Found"),)
    //:
    ListView(
      shrinkWrap: true,
      children: [
        for(var lan =0 ; lan < HomeController.cvUser.languages.listLanguage.length ; lan++)
          LanguageForm(
            index: lan +1,
            userLanguage: userLanguage[0],
            onDelete: () {
           // if (lan > 0) {
              HomeController.cvUser.languages.listLanguage.removeAt(lan);
               onDelete(userLanguage,lan);
             //}
    },
            onAddForm: () {
              setState(() {
                userLanguage.add(UserLanguage());
                HomeController.cvUser.languages.listLanguage.add(Language(name: '', level: 0));
              });
            },
          ),
        PTCDvider(),
        for(var skil =0 ; skil < HomeController.cvUser.personalSkills.listPersonalSkill.length ; skil++)
          SkilsForm(
            index: skil +1,
            userSkil: userSkils[0],
            onDelete: (){ //if(skil>0) {
              HomeController.cvUser.personalSkills.listPersonalSkill.removeAt(skil);
              onDelete(userSkils,skil);
            //}
            },
            onAddForm: (){
              setState(() {
                userSkils.add(UserSkils());
                HomeController.cvUser.personalSkills.listPersonalSkill.add(PersonalSkill(name: '', level: 0));
              });
            },
          ),
        PTCDvider(),
        for(var course =0 ; course < HomeController.cvUser.courses.listCourse.length ; course++)
          CoursesForm(
            index: course +1,
            userCourses: userCourses[0],
            onDelete: () {
              //if (course > 0) {
                HomeController.cvUser.courses.listCourse.removeAt(course);
                onDelete(userCourses, course);
              //}
            },
            onAddForm: (){
              setState(() {
                userCourses.add(UserCourses());
                HomeController.cvUser.courses.listCourse.add(Course.genCourse());
              });
            },
          )
      ],
    );
  }
  void onAddForm(List list){
    setState(() {
      list.add(list);
    });
  }
  void onDelete(List list,int index){
    setState(() {
      //list.removeAt(index);
    });
  }
}
