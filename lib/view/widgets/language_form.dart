import 'package:flutter/material.dart';
import 'package:ptc_project/model/models.dart';
import 'package:ptc_project/view/resourse/color_manager.dart';
import 'package:ptc_project/view/resourse/values_manager.dart';


class LanguageForm extends StatelessWidget {
  final UserLanguage? userLanguage;
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
                      (index!-1) ==0?SizedBox():IconButton(onPressed:onDelete , icon: Icon(Icons.delete)),
                      (index!-1)!=0?SizedBox(): IconButton(onPressed:onAddForm , icon: Icon(Icons.add)),

                    ],
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Language Name"
                ),
              ),
              const SizedBox(height: AppSize.s10,),
              DropdownButtonFormField(
                  decoration: InputDecoration(
                      hintText: "Language Level",
                      prefixIcon: Icon(Icons.language)
                  ),
                  items: [1,2,3,4,5].map((e) => DropdownMenuItem(

                    child: Text("$e"),
                    value: e,
                  )).toList(), onChanged: (val){})
            ],
          ),
        ),
      ),
    );
  }
}
