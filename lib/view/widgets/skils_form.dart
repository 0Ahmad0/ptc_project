import 'package:flutter/material.dart';
import 'package:ptc_project/model/models.dart';
import 'package:ptc_project/view/resourse/color_manager.dart';
import 'package:ptc_project/view/resourse/values_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SkilsForm extends StatelessWidget {
  final UserSkils? userSkil;
  final VoidCallback? onDelete;
  final VoidCallback? onAddForm;
  final int? index;
  SkilsForm({this.userSkil,this.onDelete, this.onAddForm, this.index});
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
                  Flexible(child: Text("Skils${index}")),
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
                    hintText: "Skils Name"
                ),
              ),
              const SizedBox(height: AppSize.s10,),
              DropdownButtonFormField(
                  decoration: InputDecoration(
                      hintText: "Skils Level",
                      prefixIcon: Icon(Icons.polymer)
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


