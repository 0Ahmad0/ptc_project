import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ptc_project/model/models.dart';
import 'package:ptc_project/view/resourse/color_manager.dart';
import 'package:ptc_project/view/resourse/values_manager.dart';
class WorkForm extends StatelessWidget {
  final UserWork? userWork;
  final VoidCallback? onDelete;
  final VoidCallback? onAddForm;
  final int? index;
  WorkForm({this.userWork,this.onDelete, this.onAddForm, this.index});
  final form = GlobalKey<FormState>();
  final dateController = TextEditingController(text: "Start Date");
  bool validate(){
    var valid = form.currentState!.validate();
    if(valid)  form.currentState!.save();
    return valid;
  }
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
      dateController
        ..text = DateFormat.yMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: dateController.text.length,
            affinity: TextAffinity.upstream));
    }
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
                  Flexible(child: Text("Work${index}")),
                  Row(
                    children: [
                      (index!-1) ==0?SizedBox(): IconButton(onPressed:onDelete , icon: Icon(Icons.delete)),
                      (index!-1)!=0?SizedBox(): IconButton(onPressed:onAddForm , icon: Icon(Icons.add)),

                    ],
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Work Name"
                ),
              ),
              const SizedBox(height: AppSize.s10,),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Work Company"
                ),
              ),
              const SizedBox(height: AppSize.s10,),
              DropdownButtonFormField(
                  decoration: InputDecoration(
                      hintText: "Work Type ",
                      prefixIcon: Icon(Icons.work)
                  ),
                  items: ['Internal','External'].map((e) => DropdownMenuItem(

                    child: Text("$e"),
                    value: e,
                  )).toList(), onChanged: (val){}),
              const SizedBox(height: AppSize.s10,),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Contact Info"
                ),
              ),
              const SizedBox(height: AppSize.s10,),
              TextFormField(
                controller: dateController,
                readOnly: true,
                onTap: () {
                  _selectDate(context);
                },
              ),
              const SizedBox(height: AppSize.s10,),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Email Company"
                ),),
              const SizedBox(height: AppSize.s10,),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Phone Company"
                ),),
            ],
          ),
        ),
      ),
    );
  }
}

