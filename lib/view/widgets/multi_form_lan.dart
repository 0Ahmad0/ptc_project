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
      children: [
        for(var lan =0 ; lan < userLanguage.length ; lan++)
          LanguageForm(
            index: lan +1,
            userLanguage: userLanguage[lan],
            onDelete: () {
            if (lan > 0) {
              HomeController.cvUser.languages.listLanguage.removeAt(lan);
               onDelete(userLanguage,lan);
             }
    },
            onAddForm: () {
              setState(() {
                userLanguage.add(UserLanguage());
                HomeController.cvUser.languages.listLanguage.add(Language(name: '', level: 0));
              });
            },
          ),
        PTCDvider(),
        for(var skil =0 ; skil < userSkils.length ; skil++)
          SkilsForm(
            index: skil +1,
            userSkil: userSkils[skil],
            onDelete: (){ if(skil>0) {
              HomeController.cvUser.skills.listSkill.removeAt(skil);
              onDelete(userSkils,skil);
            }
            },
            onAddForm: (){
              setState(() {
                userSkils.add(UserSkils());
                HomeController.cvUser.skills.listSkill.add(Skill(name: '', level: 0));
              });
            },
          ),
        PTCDvider(),
        for(var course =0 ; course < userCourses.length ; course++)
          CoursesForm(
            index: course +1,
            userCourses: userCourses[course],
            onDelete: () {
              if (course > 0) {
                HomeController.cvUser.courses.listCourse.removeAt(course);
                onDelete(userCourses, course);
              }
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
      list.removeAt(index);
    });
  }
}
