
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
    positionPersonPlaceController.text=HomeController.cvUser.workPlaces.listWorkPlace[indexWorkPlace!-1].works.listWork[index!-1].positionPersonPlace;
    skillsPersonPlaceController.text=HomeController.cvUser.workPlaces.listWorkPlace[indexWorkPlace!-1].works.listWork[index!-1].skillsPersonPlace;
    levelPersonPlaceController.text=HomeController.cvUser.workPlaces.listWorkPlace[indexWorkPlace!-1].works.listWork[index!-1].levelPersonPlace;
    dateController.text=DateFormat.yMd().format(HomeController.cvUser.workPlaces.listWorkPlace[indexWorkPlace!-1].works.listWork[index!-1].startDate);
    dateEndController.text=DateFormat.yMd().format(HomeController.cvUser.workPlaces.listWorkPlace[indexWorkPlace!-1].works.listWork[index!-1].endDate);
    return Card(
      child: ListView(
        padding: const EdgeInsets.all(AppPadding.p12),
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: Text("Work ${index}")),
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
                    _selectDate(context,dateController);
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
                    _selectDate(context,dateEndController);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSize.s10,),
          TextFormField(
            decoration: InputDecoration(
                hintText: "level Person work"
            ),
            onChanged: (val){
              HomeController.cvUser.workPlaces.listWorkPlace[indexWorkPlace!-1].works.listWork[index!-1].levelPersonPlace=val;},
          ),
          const SizedBox(height: AppSize.s10,),
          TextFormField(
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
