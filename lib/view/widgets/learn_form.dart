import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ptc_project/model/models.dart';
import 'package:ptc_project/model/utils/sizer.dart';
import 'package:ptc_project/view/resourse/color_manager.dart';
import 'package:ptc_project/view/resourse/values_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../controller/home_controller.dart';

class LearnForm extends StatelessWidget {
  final UserLearn? userLearn;
  final VoidCallback? onDelete;
  final VoidCallback? onAddForm;
  final int? index;
  final controllerLearnName= TextEditingController();
  final controllerLearnYear= TextEditingController();
  LearnForm({this.userLearn,this.onDelete, this.onAddForm, this.index});
  final form = GlobalKey<FormState>();
  final dateController = TextEditingController(text: "Start Date");
  final dateEndController = TextEditingController(text: "End Date");
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
      // if(typeDate==0)
      //   HomeController.cvUser.workPlaces.listWorkPlace[indexWorkPlace!-1].works.listWork[index!-1].startDate=_selectedDate;
      // else {
      //   HomeController.cvUser.workPlaces.listWorkPlace[indexWorkPlace!-1].works.listWork[index!-1].endDate=_selectedDate;
      //   HomeController.cvUser.workPlaces.listWorkPlace[indexWorkPlace!-1].works.listWork[index!-1].endDateForNow=true;
      // }
      controller
        ..text = DateFormat.yMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: dateController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  bool validate(){
    var valid = form.currentState!.validate();
    if(valid)  form.currentState!.save();
    return valid;
  }
  List<String> listYears = [
    'First Year',
    'Second Year',
    'Third Year',
    'Fourth Year',
    'Fifth Year',
    'Sixth Year',
    'Master',
    'Doctor',
    'Other...',
  ];
  @override
  Widget build(BuildContext context) {
    controllerLearnName.text=HomeController.cvUser.skills.listSkill[index!-1].name;
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
                  Flexible(child: Text("Learn ${index}")),
                  Row(
                    children: [
                      (HomeController.cvUser.skills.listSkill.length<2)?SizedBox():IconButton(onPressed:onDelete , icon: Icon(Icons.delete)),
                      (index!-1)!=0?SizedBox(): IconButton(onPressed:onAddForm , icon: Icon(Icons.add)),

                    ],
                  ),
                ],
              ),
              TextFormField(
                controller: controllerLearnName,
                decoration: InputDecoration(
                    hintText: "Learn Name"
                ),
                onChanged: (val){
                  HomeController.cvUser.skills.listSkill[index!-1].name=val;},
              ),
              const SizedBox(height: AppSize.s10,),
              TextFormField(
                controller: controllerLearnName,
                decoration: InputDecoration(
                    hintText: "Learn Status"
                ),
                onChanged: (val){
                  HomeController.cvUser.skills.listSkill[index!-1].name=val;},
              ),
              const SizedBox(height: AppSize.s10,),
              DropdownButtonFormField(
                  decoration: InputDecoration(
                    hintText: 'year'
                  ),
                  items: [
                for(var i = 0 ; i < listYears.length ; i ++)
                  DropdownMenuItem(
                    child: Text(listYears[i]),
                    value: listYears[i],
                  )
              ], onChanged: (val){}),
              const SizedBox(height: AppSize.s10,),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: dateController,
                      readOnly: true,
                      onTap: () {
                        _selectDate(context,dateController,0);
                        // HomeController.cvUser.workPlaces.listWorkPlace[indexWorkPlace!-1].works.listWork[index!-1].startDate=DateFormat().parse(dateController.text);
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
              )

            ],
          ),
        ),
      ),
    );
  }
}


