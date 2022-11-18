import 'package:flutter/material.dart';
import 'package:ptc_project/model/models.dart';
import 'package:ptc_project/view/resourse/color_manager.dart';
import 'package:ptc_project/view/resourse/values_manager.dart';

import '../../controller/home_controller.dart';


class LanguageForm extends StatelessWidget {
  final UserLanguage? userLanguage;
  final controllerLanName= TextEditingController();
  final controllerLevel = TextEditingController();
  final VoidCallback? onDelete;
  final VoidCallback? onAddForm;
  final int? index;
  LanguageForm({this.userLanguage,this.onDelete, this.onAddForm, this.index});

  final form = GlobalKey<FormState>();

  bool validate(){
    var valid = form.currentState!.validate();
    if(valid)  form.currentState!.save();
    return valid;
  }
  @override
  Widget build(BuildContext context) {
    controllerLanName.text=HomeController.cvUser.languages.listLanguage[index!-1].name;
    controllerLevel.text=HomeController.cvUser.languages.listLanguage[index!-1].level.toString();

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
                  Flexible(child: Text("Language${index}")),
                  Row(
                    children: [
                      (HomeController.cvUser.languages.listLanguage.length<2)?SizedBox():IconButton(onPressed:onDelete , icon: Icon(Icons.delete)),
                      (index!-1)!=0?SizedBox(): IconButton(onPressed:onAddForm , icon: Icon(Icons.add)),

                    ],
                  ),
                ],
              ),
              TextFormField(
                controller: controllerLanName,
                decoration: InputDecoration(
                    hintText: "Language Name"
                ),
                onChanged: (val){
                  HomeController.cvUser.languages.listLanguage[index!-1].name=val;},
              ),
              const SizedBox(height: AppSize.s10,),
              DropdownButtonFormField(
                  value: HomeController.cvUser.languages.listLanguage[index!-1].level==0
                      ?null:HomeController.cvUser.languages.listLanguage[index!-1].level,
                  decoration: InputDecoration(
                      hintText: "Language Level",
                      prefixIcon: Icon(Icons.language)
                  ),
                  items: [1,2,3,4,5].map((e) => DropdownMenuItem(
                    child: Text("$e"),
                    value: e,
                  )).toList(), onChanged: (val){
                    HomeController.cvUser.languages.listLanguage[index!-1].level=int.parse(val.toString());})
            ],
          ),
        ),
      ),
    );
  }
}
