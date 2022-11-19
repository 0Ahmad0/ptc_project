
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ptc_project/model/models.dart';

import '../../controller/home_controller.dart';
import '../resourse/color_manager.dart';
import '../resourse/values_manager.dart';

class WorkForm extends StatelessWidget {
  final UserWork? userWork;
  final VoidCallback? onDelete;
  final VoidCallback? onAddForm;
  final int? index;
  final int? indexWorkPlace;
  WorkForm({this.userWork,this.onDelete, this.onAddForm, this.index, this.indexWorkPlace});
  final form = GlobalKey<FormState>();
  final dateController = TextEditingController(text: "Start Date");
  final dateEndController = TextEditingController(text: "End Date");
  final levelPersonPlaceController = TextEditingController();
  final skillsPersonPlaceController = TextEditingController();
  final positionPersonPlaceController = TextEditingController();
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
        HomeController.cvUser.workPlaces.listWorkPlace[indexWorkPlace!-1].works.listWork[index!-1].startDate=_selectedDate;
      else {
        HomeController.cvUser.workPlaces.listWorkPlace[indexWorkPlace!-1].works.listWork[index!-1].endDate=_selectedDate;
        HomeController.cvUser.workPlaces.listWorkPlace[indexWorkPlace!-1].works.listWork[index!-1].endDateForNow=true;
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
    positionPersonPlaceController.text=HomeController.cvUser.workPlaces.listWorkPlace[indexWorkPlace!-1].works.listWork[index!-1].positionPersonPlace;
    skillsPersonPlaceController.text=HomeController.cvUser.workPlaces.listWorkPlace[indexWorkPlace!-1].works.listWork[index!-1].skillsPersonPlace;
    levelPersonPlaceController.text=HomeController.cvUser.workPlaces.listWorkPlace[indexWorkPlace!-1].works.listWork[index!-1].levelPersonPlace;
    HomeController.cvUser.workPlaces.listWorkPlace[indexWorkPlace!-1].works.listWork[index!-1].startDate.year>1?
    dateController.text=DateFormat.yMd().format(HomeController.cvUser.workPlaces.listWorkPlace[indexWorkPlace!-1].works.listWork[index!-1].startDate):null;
    HomeController.cvUser.workPlaces.listWorkPlace[indexWorkPlace!-1].works.listWork[index!-1].endDate.year>1?
    dateEndController.text=DateFormat.yMd().format(HomeController.cvUser.workPlaces.listWorkPlace[indexWorkPlace!-1].works.listWork[index!-1].endDate):null;
    return Card(
      child: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p12,
          horizontal: AppPadding.p20
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: Text("Work ${index}")),
              Row(
                children: [
                  (HomeController.cvUser.workPlaces.listWorkPlace[indexWorkPlace!-1].works.listWork.length<2)
                      ?SizedBox():IconButton(onPressed:onDelete , icon: Icon(Icons.delete)),
                  //(index!-1) ==0?SizedBox():IconButton(onPressed:onDelete , icon: Icon(Icons.delete)),
                  (index!-1)!=0?SizedBox(): IconButton(onPressed:onAddForm , icon: Icon(Icons.add)),

                ],
              ),
            ],
          ),
          TextFormField(
            controller: positionPersonPlaceController,
            decoration: InputDecoration(
              hintText: "Position Person work"
            ),
            onChanged: (val){
              HomeController.cvUser.workPlaces.listWorkPlace[indexWorkPlace!-1].works.listWork[index!-1].positionPersonPlace=val;},
          ),
          const SizedBox(height: AppSize.s10,),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: dateController,
                  readOnly: true,
                  onTap: () {
                    _selectDate(context,dateController,0);
                    HomeController.cvUser.workPlaces.listWorkPlace[indexWorkPlace!-1].works.listWork[index!-1].startDate=DateFormat().parse(dateController.text);
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
            controller: levelPersonPlaceController,
            decoration: InputDecoration(
                hintText: "level Person work"
            ),
            onChanged: (val){
              HomeController.cvUser.workPlaces.listWorkPlace[indexWorkPlace!-1].works.listWork[index!-1].levelPersonPlace=val;},
          ),
          const SizedBox(height: AppSize.s10,),
          TextFormField(
            controller: skillsPersonPlaceController,
            decoration: InputDecoration(
                hintText: "skills Person work"
            ),
            onChanged: (val){
              HomeController.cvUser.workPlaces.listWorkPlace[indexWorkPlace!-1].works.listWork[index!-1].skillsPersonPlace=val;},
          ),
        ],
      ),
    );
  }
}
