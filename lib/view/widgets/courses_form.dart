import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ptc_project/model/models.dart';
import 'package:ptc_project/view/resourse/color_manager.dart';
import 'package:ptc_project/view/resourse/values_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../controller/home_controller.dart';

class CoursesForm extends StatelessWidget {
  final UserCourses? userCourses;
  final VoidCallback? onDelete;
  final VoidCallback? onAddForm;
  final int? index;
  final controllerCourseName= TextEditingController();
  final controllerDescription= TextEditingController();
  final controllerCertificateSide= TextEditingController();
  final controllerCertificateType= TextEditingController();
  final controllerCertificateName= TextEditingController();
  CoursesForm(
      {super.key,
        this.userCourses,
        this.onDelete,
        this.onAddForm,
        this.index = 1});
  final form = GlobalKey<FormState>();
  final dateController = TextEditingController(text: "Date");
  DateTime _selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    var newSelectedDate = await showDatePicker(
      builder: (context, child) {
        return child!;
      },
      context: context,
      initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2040),
    );

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      HomeController.cvUser.courses.listCourse[index!-1].date=_selectedDate;
      dateController
        ..text = DateFormat.yMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: dateController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  bool validate() {
    var valid = form.currentState!.validate();
    if (valid) form.currentState!.save();
    return valid;
  }
  @override
  Widget build(BuildContext context) {
    controllerCourseName.text=HomeController.cvUser.courses.listCourse[index!-1].name;
    controllerDescription.text=HomeController.cvUser.courses.listCourse[index!-1].description;
    controllerCertificateName.text=HomeController.cvUser.courses.listCourse[index!-1].certificateName;
    controllerCertificateSide.text=HomeController.cvUser.courses.listCourse[index!-1].certificateSide;
    controllerCertificateType.text=HomeController.cvUser.courses.listCourse[index!-1].certificateType;
    HomeController.cvUser.courses.listCourse[index!-1].date.year>1
        ?dateController.text=DateFormat.yMd().format(HomeController.cvUser.courses.listCourse[index!-1].date)
    :null;
    return Form(
      key: form,
      child: Card(
        color: ColorManager.white,
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: Text("Course${index}")),
                  Row(
                    children: [
                     (HomeController.cvUser.courses.listCourse.length<2)?SizedBox(): IconButton(onPressed: onDelete, icon: Icon(Icons.delete)),
                     (index!-1)!=0?SizedBox():  IconButton(onPressed: onAddForm, icon: Icon(Icons.add)),
                    ],
                  ),
                ],
              ),
              TextFormField(
                controller: controllerCourseName,
                decoration: InputDecoration(hintText: "Course Name"),
                onChanged: (val){
                  HomeController.cvUser.courses.listCourse[index!-1].name=val;},
              ),
              const SizedBox(
                height: AppSize.s10,
              ),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField(
                        value: HomeController.cvUser.courses.listCourse[index!-1].level==0
                            ?null:HomeController.cvUser.courses.listCourse[index!-1].level,
                        decoration: InputDecoration(
                            hintText: "Course Level",
                            prefixIcon: Icon(FontAwesomeIcons.graduationCap)),
                        items: [1, 2, 3, 4, 5]
                            .map((e) => DropdownMenuItem(
                          child: Text("$e"),
                          value: e,
                        ))
                            .toList(),
                        onChanged: (val) {HomeController.cvUser.courses.listCourse[index!-1].level=int.parse(val.toString());}),
                  ),
                  const SizedBox(
                    width: AppSize.s10,
                  ),
                  Expanded(
                      child: TextFormField(
                        controller: dateController,
                        readOnly: true,
                        onTap: () {
                          _selectDate(context);

                        },
                      )),
                ],
              ),
              const SizedBox(
                height: AppSize.s10,
              ),
              TextFormField(
                controller: controllerDescription,
                decoration: InputDecoration(hintText: "Description"),
                onChanged: (val){
                  HomeController.cvUser.courses.listCourse[index!-1].description=val;
                },
              ),
              const SizedBox(
                height: AppSize.s10,
              ),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                        controller: controllerCertificateName,
                        decoration: InputDecoration(
                          hintText: "Certificate Name",
                        ),onChanged: (val){
                        HomeController.cvUser.courses.listCourse[index!-1].certificateName=val;
                      },
                      )),
                  const SizedBox(width: AppSize.s10,),
                  Expanded(
                    child: TextFormField(
                      controller: controllerCertificateType,
                      decoration: InputDecoration(
                        hintText: "Certificate Type",
                      ),
                      onChanged: (val){
                        HomeController.cvUser.courses.listCourse[index!-1].certificateType=val;
                      },
                    ),
                  ),
                  const SizedBox(width: AppSize.s10,),
                  Expanded(
                    child: TextFormField(
                      controller: controllerCertificateSide,
                      decoration: InputDecoration(
                        hintText: "Certificate Side",
                      ),
                      onChanged: (val){
                        HomeController.cvUser.courses.listCourse[index!-1].certificateSide=val;
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
