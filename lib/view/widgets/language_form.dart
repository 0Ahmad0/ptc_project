import 'package:flutter/material.dart';
import 'package:ptc_project/model/models.dart';
import 'package:ptc_project/view/resourse/color_manager.dart';
import 'package:ptc_project/view/resourse/values_manager.dart';
typedef OnDelete();
typedef OnAddForm();
class LanguageForm extends StatefulWidget {
  final UserLanguage? userLanguage;
  final  state = _LanguageFormState();
  final OnDelete? onDelete;
  final OnAddForm? onAddForm;
  final int? index;
  LanguageForm({this.userLanguage,this.onDelete, this.onAddForm, this.index});
  @override
  _LanguageFormState createState() => state;

  bool isValid ()=> state.validate();

}

class _LanguageFormState extends State<LanguageForm> {
  final form = GlobalKey<FormState>();
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
                  Flexible(child: Text("Language${widget.index}")),
                  Row(
                    children: [
                      IconButton(onPressed:widget.onDelete , icon: Icon(Icons.delete)),
                      IconButton(onPressed:widget.onAddForm , icon: Icon(Icons.add)),

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
  bool validate(){
    var valid = form.currentState!.validate();
    if(valid)  form.currentState!.save();
    return valid;
  }
}
