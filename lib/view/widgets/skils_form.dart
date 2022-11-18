import 'package:flutter/material.dart';
import 'package:ptc_project/model/models.dart';
import 'package:ptc_project/view/resourse/color_manager.dart';
import 'package:ptc_project/view/resourse/values_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../controller/home_controller.dart';

class SkilsForm extends StatelessWidget {
  final UserSkils? userSkil;
  final VoidCallback? onDelete;
  final VoidCallback? onAddForm;
  final int? index;
  final controllerSkillName= TextEditingController();
  SkilsForm({this.userSkil,this.onDelete, this.onAddForm, this.index});
  final form = GlobalKey<FormState>();

  bool validate(){
    var valid = form.currentState!.validate();
    if(valid)  form.currentState!.save();
    return valid;
  }
  @override
  Widget build(BuildContext context) {
    controllerSkillName.text=HomeController.cvUser.skills.listSkill[index!-1].name;
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
                  Flexible(child: Text("Skils${index}")),
                  Row(
                    children: [
                     (HomeController.cvUser.skills.listSkill.length<2)?SizedBox():IconButton(onPressed:onDelete , icon: Icon(Icons.delete)),
                     (index!-1)!=0?SizedBox(): IconButton(onPressed:onAddForm , icon: Icon(Icons.add)),

                    ],
                  ),
                ],
              ),
              TextFormField(
                controller: controllerSkillName,
                decoration: InputDecoration(
                    hintText: "Skils Name"
                ),
                onChanged: (val){
                  HomeController.cvUser.skills.listSkill[index!-1].name=val;},
              ),
              const SizedBox(height: AppSize.s10,),
              DropdownButtonFormField(
                  value: HomeController.cvUser.skills.listSkill[index!-1].level==0
                      ?null:HomeController.cvUser.skills.listSkill[index!-1].level,
                  decoration: InputDecoration(
                      hintText: "Skils Level",
                      prefixIcon: Icon(Icons.polymer)
                  ),
                  items: [1,2,3,4,5].map((e) => DropdownMenuItem(

                    child: Text("$e"),
                    value: e,
                  )).toList(), onChanged: (val){HomeController.cvUser.skills.listSkill[index!-1].level=int.parse(val.toString());})
            ],
          ),
        ),
      ),
    );
  }
}


