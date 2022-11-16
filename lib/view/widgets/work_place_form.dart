import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ptc_project/model/models.dart';
import 'package:ptc_project/view/resourse/color_manager.dart';
import 'package:ptc_project/view/resourse/values_manager.dart';
import 'package:ptc_project/view/widgets/work_form.dart';
class WorkPlaceForm extends StatefulWidget {
  final UserPlaceWork? userWork;
  final VoidCallback? onDelete;
  final VoidCallback? onAddForm;
  final int? index;
  WorkPlaceForm({this.userWork,this.onDelete, this.onAddForm, this.index});

  @override
  State<WorkPlaceForm> createState() => _WorkPlaceFormState();
}

class _WorkPlaceFormState extends State<WorkPlaceForm> {
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

  List<UserWork> usersWork = [
    UserWork(name: "name")
  ];

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
                  Flexible(child: Text("Work Place${widget.index}")),
                  Row(
                    children: [
                      (widget.index!-1) ==0?SizedBox(): IconButton(onPressed:widget.onDelete , icon: Icon(Icons.delete)),
                      (widget.index!-1)!=0?SizedBox(): IconButton(onPressed:widget.onAddForm , icon: Icon(Icons.add)),

                    ],
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Work Place Name"
                ),
              ),
              const SizedBox(height: AppSize.s10,),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Work Place Company"
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
              const SizedBox(height: AppSize.s10,),
             for(var work =0 ; work< usersWork.length ; work ++)
               WorkForm(
                 userWork: usersWork[work],
                 index: work+1,
                 onAddForm: (){
                   usersWork.add(UserWork(name: "name"));
                   setState(() {

                   });
                 },
                 onDelete: (){
                   usersWork.removeAt(work);
                   setState(() {

                   });
                 },
               )
            ],
          ),
        ),
      ),
    );
  }
}
