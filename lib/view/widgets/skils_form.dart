import 'package:flutter/material.dart';
import 'package:ptc_project/model/models.dart';
import 'package:ptc_project/view/resourse/color_manager.dart';
import 'package:ptc_project/view/resourse/values_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
typedef OnDelete();
typedef OnAddForm();
class SkilsForm extends StatefulWidget {
  final UserSkils? userSkil;
  final  state = _SkilsFormState();
  final OnDelete? onDelete;
  final OnAddForm? onAddForm;
  final int? index;
  SkilsForm({this.userSkil,this.onDelete, this.onAddForm, this.index});
  @override
  _SkilsFormState createState() => state;

  bool isValid ()=> state.validate();

}

class _SkilsFormState extends State<SkilsForm> {
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
                  Flexible(child: Text("Skils${widget.index}")),
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
  bool validate(){
    var valid = form.currentState!.validate();
    if(valid)  form.currentState!.save();
    return valid;
  }
}
