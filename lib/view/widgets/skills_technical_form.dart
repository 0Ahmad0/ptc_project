import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ptc_project/model/models.dart';
import 'package:ptc_project/view/resourse/color_manager.dart';
import 'package:ptc_project/view/resourse/values_manager.dart';

import '../../controller/home_controller.dart';


class SkillsTechnicalForm extends StatelessWidget {
  final UserTechnicalSkills? userTechnicalSkills;
  final VoidCallback? onDelete;
  final VoidCallback? onAddForm;
  final int? index;
  SkillsTechnicalForm({this.userTechnicalSkills,this.onDelete, this.onAddForm, this.index});

  final form = GlobalKey<FormState>();
  final dateController = TextEditingController(text: "Start Date");
  final dateEndController = TextEditingController(text: "End Date");
  final skillsNameController = TextEditingController();
  final skillsLevelController = TextEditingController();
  final skillsTypeController = TextEditingController();
  bool validate(){
    var valid = form.currentState!.validate();
    if(valid)  form.currentState!.save();
    return valid;
  }
  DateTime _selectedDate = DateTime.now();

  _selectDate(BuildContext context,TextEditingController controller) async {
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
      controller
        ..text = DateFormat.yMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: dateController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  @override
  Widget build(BuildContext context) {
    skillsLevelController.text=HomeController.cvUser.technicalSkills.listTechnicalSkill[index!-1].skillsLevel;
    skillsTypeController.text=HomeController.cvUser.technicalSkills.listTechnicalSkill[index!-1].skillsType;
    skillsNameController.text=HomeController.cvUser.technicalSkills.listTechnicalSkill[index!-1].skillsName;
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
                  Flexible(child: Text("Thechnical Skills ${index}")),
                  Row(
                    children: [
                     // (index!-1) ==0?SizedBox():IconButton(onPressed:onDelete , icon: Icon(Icons.delete)),
                      (HomeController.cvUser.technicalSkills.listTechnicalSkill.length<2)?SizedBox():IconButton(onPressed:onDelete , icon: Icon(Icons.delete)),
                      (index!-1)!=0?SizedBox(): IconButton(onPressed:onAddForm , icon: Icon(Icons.add)),

                    ],
                  ),
                ],
              ),
              TextFormField(
                controller: skillsTypeController,
                decoration: InputDecoration(
                    hintText: "Skills Type"
                ),
                onChanged: (val)=> HomeController.cvUser.technicalSkills.listTechnicalSkill[index!-1].skillsType=val,
              ),
              const SizedBox(height: AppSize.s10,),
              TextFormField(
                controller: skillsNameController,
                decoration: InputDecoration(
                    hintText: "Skills Name"
                ),
                onChanged: (val)=> HomeController.cvUser.technicalSkills.listTechnicalSkill[index!-1].skillsName=val,
              ),
              const SizedBox(height: AppSize.s10,),
              DropdownButtonFormField(
                value:  HomeController.cvUser.technicalSkills.listTechnicalSkill[index!-1].skillsLevel!=''
                    ?HomeController.cvUser.technicalSkills.listTechnicalSkill[index!-1].skillsLevel
                  :null,
                  decoration: InputDecoration(
                      hintText: "Skill Level",
                      prefixIcon: Icon(Icons.polymer)
                  ),
                  items: ['trainer','junior','mid','senior'].map((e) => DropdownMenuItem(

                    child: Text("$e"),
                    value: e,
                  )).toList(), onChanged: (val){HomeController.cvUser.technicalSkills.listTechnicalSkill[index!-1].skillsLevel=val.toString();})


            ],
          ),
        ),
      ),
    );
  }
}
