
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ptc_project/model/models.dart';

import '../resourse/color_manager.dart';
import '../resourse/values_manager.dart';

class WorkForm extends StatelessWidget {
  final UserWork? userWork;
  final VoidCallback? onDelete;
  final VoidCallback? onAddForm;
  final int? index;
  WorkForm({this.userWork,this.onDelete, this.onAddForm, this.index});
  final form = GlobalKey<FormState>();
  final dateController = TextEditingController(text: "Start Date");
  final dateEndController = TextEditingController(text: "End Date");
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
          ),
          const SizedBox(height: AppSize.s10,),
          TextFormField(
            decoration: InputDecoration(
                hintText: "skills Person work"
            ),
          ),
        ],
      ),
    );
  }
}
