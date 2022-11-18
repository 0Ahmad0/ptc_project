import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ptc_project/model/models.dart';
import 'package:ptc_project/view/resourse/color_manager.dart';
import 'package:ptc_project/view/resourse/values_manager.dart';

import '../../controller/home_controller.dart';


class ProjectForm extends StatelessWidget {
  final UserProject? userProject;
  final VoidCallback? onDelete;
  final VoidCallback? onAddForm;
  final int? index;
  ProjectForm({this.userProject,this.onDelete, this.onAddForm, this.index});

  final form = GlobalKey<FormState>();
  final dateController = TextEditingController(text: "Start Date");
  final dateEndController = TextEditingController(text: "End Date");
  final descriptionProjectController = TextEditingController();
  final linkProjectController = TextEditingController();
  final nameProjectController = TextEditingController();
  final stakeholderController = TextEditingController();
  final typeProjectController = TextEditingController();
  bool validate(){
    var valid = form.currentState!.validate();
    if(valid)  form.currentState!.save();
    return valid;
  }
  DateTime _selectedDate = DateTime.now();

  _selectDate(BuildContext context,TextEditingController controller,int typeDate) async {
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
      if(typeDate==0)
          HomeController.cvUser.projects.listProject[index!-1].startDate=_selectedDate;
      else {
    HomeController.cvUser.projects.listProject[index!-1].endDate=_selectedDate;
    HomeController.cvUser.projects.listProject[index!-1].endDateForNow=true;
    }

      controller
        ..text = DateFormat.yMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: dateController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  @override
  Widget build(BuildContext context) {
    stakeholderController.text = HomeController.cvUser.projects.listProject[index!-1].stakeholder;
    nameProjectController.text = HomeController.cvUser.projects.listProject[index!-1].nameProject;
    linkProjectController.text = HomeController.cvUser.projects.listProject[index!-1].linkProject;
    descriptionProjectController.text = HomeController.cvUser.projects.listProject[index!-1].descriptionProject;
    typeProjectController.text = HomeController.cvUser.projects.listProject[index!-1].typeProject;
    HomeController.cvUser.projects.listProject[index!-1].startDate.year>0?
    dateController.text =DateFormat.yMd().format(HomeController.cvUser.projects.listProject[index!-1].startDate):null;
    HomeController.cvUser.projects.listProject[index!-1].endDate.year>0?
    dateEndController.text =DateFormat.yMd().format(HomeController.cvUser.projects.listProject[index!-1].endDate):null;
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
                  Flexible(child: Text("Project${index}")),
                  Row(
                    children: [
                      (HomeController.cvUser.projects.listProject.length<2)?SizedBox():IconButton(onPressed:onDelete , icon: Icon(Icons.delete)),
                      (index!-1)!=0?SizedBox(): IconButton(onPressed:onAddForm , icon: Icon(Icons.add)),

                    ],
                  ),
                ],
              ),
              TextFormField(
                controller: nameProjectController,
                decoration: InputDecoration(
                    hintText: "Project Name"
                ),
                onChanged: (val)=> HomeController.cvUser.projects.listProject[index!-1].nameProject=val,
              ),
              const SizedBox(height: AppSize.s10,),
              TextFormField(
                controller: typeProjectController,
                decoration: InputDecoration(
                    hintText: "Project Type"
                ),
                onChanged: (val)=> HomeController.cvUser.projects.listProject[index!-1].typeProject=val,
              ),
              const SizedBox(height: AppSize.s10,),
              TextFormField(
                controller: descriptionProjectController,
                decoration: InputDecoration(
                    hintText: "Project Description"
                ),
                onChanged: (val)=> HomeController.cvUser.projects.listProject[index!-1].descriptionProject=val,
              ),
              const SizedBox(height: AppSize.s10,),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: dateController,
                      readOnly: true,
                      onTap: () async {
                       await _selectDate(context,dateController,0);
                      // HomeController.cvUser.projects.listProject[index!-1].startDate=DateTime.parse(dateController.text);
                      },
                    ),
                  ),
                  const SizedBox(width: AppSize.s10,),
                  Expanded(
                    child: TextFormField(
                      controller: dateEndController,
                      readOnly: true,
                      onTap: () {
                        _selectDate(context,dateEndController,1);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s10,),
              TextFormField(
                controller: stakeholderController,
                decoration: InputDecoration(
                    hintText: "To"
                ),
                onChanged: (val)=> HomeController.cvUser.projects.listProject[index!-1].stakeholder=val,
              ),
              const SizedBox(height: AppSize.s10,),
              TextFormField(
                controller: linkProjectController,
                decoration: InputDecoration(
                    hintText: "Project link"
                ),
                onChanged: (val)=> HomeController.cvUser.projects.listProject[index!-1].linkProject=val,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
