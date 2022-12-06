import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ptc_project/model/models.dart';
import 'package:ptc_project/model/utils/sizer.dart';
import 'package:ptc_project/view/resourse/color_manager.dart';
import 'package:ptc_project/view/resourse/values_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../controller/home_controller.dart';

class LearnForm extends StatefulWidget {
  final UserLearn? userLearn;
  final VoidCallback? onDelete;
  final VoidCallback? onAddForm;
  final int? index;

  LearnForm({this.userLearn,this.onDelete, this.onAddForm, this.index});

  @override
  State<LearnForm> createState() => _LearnFormState();
}

class _LearnFormState extends State<LearnForm> {
  final controllerEducationPlace= TextEditingController();

  final controllerEducationYear= TextEditingController();

  final controllerDropEducationYear= TextEditingController();
  final controllerEducationStatus= TextEditingController();

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
       if(typeDate==0)
         HomeController.cvUser.educations.listEducation[widget.index!-1].startDate=_selectedDate;
       else {
         HomeController.cvUser.educations.listEducation[widget.index!-1].endDate=_selectedDate;
         HomeController.cvUser.educations.listEducation[widget.index!-1].endDateForNow=true;
       }
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
    controllerEducationPlace.text=HomeController.cvUser.educations.listEducation[widget.index!-1].educationPlace;
    controllerEducationYear.text=HomeController.cvUser.educations.listEducation[widget.index!-1].educationYear;
    controllerDropEducationYear.text=listYears.contains(HomeController.cvUser.educations.listEducation[widget.index!-1].educationYear)
    ?HomeController.cvUser.educations.listEducation[widget.index!-1].educationYear
    :listYears.last;
    controllerEducationStatus.text=HomeController.cvUser.educations.listEducation[widget.index!-1].educationStatus;
    HomeController.cvUser.educations.listEducation[widget.index!-1].startDate.year>1?
    dateController.text=DateFormat.yMd().format(HomeController.cvUser.educations.listEducation[widget.index!-1].startDate):null;
    HomeController.cvUser.educations.listEducation[widget.index!-1].endDate.year>1?
    dateEndController.text=DateFormat.yMd().format(HomeController.cvUser.educations.listEducation[widget.index!-1].endDate):null;
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
                  Flexible(child: Text("Education ${widget.index}")),
                  Row(
                    children: [
                      (HomeController.cvUser.educations.listEducation.length<2)?SizedBox():IconButton(onPressed:widget.onDelete , icon: Icon(Icons.delete)),
                      (widget.index!-1)!=0?SizedBox(): IconButton(onPressed:widget.onAddForm , icon: Icon(Icons.add)),

                    ],
                  ),
                ],
              ),
              TextFormField(
                controller: controllerEducationPlace,
                decoration: InputDecoration(
                    hintText: "Education Place"
                ),
                onChanged: (val){
                  HomeController.cvUser.educations.listEducation[widget.index!-1].educationPlace=val;},
              ),
              const SizedBox(height: AppSize.s10,),
              TextFormField(
                controller: controllerEducationStatus,
                decoration: InputDecoration(
                    hintText: "Education Status"
                ),
                onChanged: (val){
                  HomeController.cvUser.educations.listEducation[widget.index!-1].educationStatus=val;},
              ),
              const SizedBox(height: AppSize.s10,),
              DropdownButtonFormField(
                value: controllerDropEducationYear.text,
                  decoration: InputDecoration(
                    hintText: 'Year'
                  ),
                  items: [
                for(var i = 0 ; i < listYears.length ; i ++)
                  DropdownMenuItem(
                    child: Text(listYears[i]),
                    value: listYears[i],
                  )
              ], onChanged: (val){
                HomeController.cvUser.educations.listEducation[widget.index!-1].educationYear=listYears.last.contains(val.toString())?'':val.toString();
                setState(() {
                });

              }),
              if(listYears.last.contains(controllerEducationYear.text)||!listYears.contains(controllerEducationYear.text))
                const SizedBox(height: AppSize.s10,),
              if(listYears.last.contains(controllerEducationYear.text)||!listYears.contains(controllerEducationYear.text))
                TextFormField(
                  controller: controllerEducationYear,
                  decoration: InputDecoration(
                      hintText: "Education Year"
                  ),
                  onChanged: (val){
                    HomeController.cvUser.educations.listEducation[widget.index!-1].educationYear=val;},
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


