import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ptc_project/model/models.dart';
import 'package:ptc_project/view/resourse/color_manager.dart';
import 'package:ptc_project/view/resourse/values_manager.dart';
import 'package:ptc_project/view/widgets/work_form.dart';

import '../../controller/home_controller.dart';
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
  final phoneCompanyController = TextEditingController();
  final emailCompanyController = TextEditingController();
  final contactInfoController = TextEditingController();
  final workTypeController = TextEditingController();
  final companyWorkPlaceController = TextEditingController();
  final nameWorkPlaceController = TextEditingController();

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
        HomeController.cvUser.workPlaces.listWorkPlace[widget.index!-1].startDate=_selectedDate;
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
    nameWorkPlaceController.text=HomeController.cvUser.workPlaces.listWorkPlace[widget.index!-1].nameWorkPlace;
    companyWorkPlaceController.text=HomeController.cvUser.workPlaces.listWorkPlace[widget.index!-1].companyWorkPlace;
    contactInfoController.text=HomeController.cvUser.workPlaces.listWorkPlace[widget.index!-1].contactInfo;
    emailCompanyController.text=HomeController.cvUser.workPlaces.listWorkPlace[widget.index!-1].emailCompany;
    workTypeController.text=HomeController.cvUser.workPlaces.listWorkPlace[widget.index!-1].workType;
    phoneCompanyController.text=HomeController.cvUser.workPlaces.listWorkPlace[widget.index!-1].phoneCompany;
    HomeController.cvUser.workPlaces.listWorkPlace[widget.index!-1].startDate.year>1?
    dateController.text=DateFormat.yMd().format(HomeController.cvUser.workPlaces.listWorkPlace[widget.index!-1].startDate):null;
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
                  Flexible(child: Text("Work Experience${widget.index}")),
                  Row(
                    children: [
                      (HomeController.cvUser.workPlaces.listWorkPlace.length<2)?SizedBox(): IconButton(onPressed:widget.onDelete , icon: Icon(Icons.delete)),
                      (widget.index!-1)!=0?SizedBox(): IconButton(onPressed:widget.onAddForm , icon: Icon(Icons.add)),

                    ],
                  ),
                ],
              ),
              TextFormField(
                controller: nameWorkPlaceController,
                decoration: InputDecoration(
                    hintText: "Work Experience Name"
                ),
                onChanged: (val){
                  HomeController.cvUser.workPlaces.listWorkPlace[widget.index!-1].nameWorkPlace=val;},
              ),
              const SizedBox(height: AppSize.s10,),
              TextFormField(
                controller: companyWorkPlaceController,
                decoration: InputDecoration(
                    hintText: "Work Place Company"
                ),
                onChanged: (val){
                  HomeController.cvUser.workPlaces.listWorkPlace[widget.index!-1].companyWorkPlace=val;},
              ),
              const SizedBox(height: AppSize.s10,),
              DropdownButtonFormField(

                value: HomeController.cvUser.workPlaces.listWorkPlace[widget.index!-1].workType!=''?
                HomeController.cvUser.workPlaces.listWorkPlace[widget.index!-1].workType
                  :null,
                  decoration: InputDecoration(
                      hintText: "Work Type ",
                      prefixIcon: Icon(Icons.work)
                  ),
                  items: ['Internal','External'].map((e) => DropdownMenuItem(

                    child: Text("$e"),
                    value: e,
                  )).toList(), onChanged: (val){
                  HomeController.cvUser.workPlaces.listWorkPlace[widget.index!-1].workType=val.toString();
              }),
              const SizedBox(height: AppSize.s10,),
              TextFormField(
                controller: contactInfoController,
                decoration: InputDecoration(
                    hintText: "Contact Info"
                ),
                onChanged: (val){
                  HomeController.cvUser.workPlaces.listWorkPlace[widget.index!-1].contactInfo=val;},
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
                controller: emailCompanyController,
                decoration: InputDecoration(
                    hintText: "Email Company"
                ),
                onChanged: (val){
                  HomeController.cvUser.workPlaces.listWorkPlace[widget.index!-1].emailCompany=val;},
              ),
              const SizedBox(height: AppSize.s10,),
              TextFormField(
                controller: phoneCompanyController,
                decoration: InputDecoration(
                    hintText: "Phone Company"
                ),
                onChanged: (val){
                  HomeController.cvUser.workPlaces.listWorkPlace[widget.index!-1].phoneCompany=val;},
              ),
              const SizedBox(height: AppSize.s10,),
             for(var work =0 ; work< HomeController.cvUser.workPlaces.listWorkPlace[widget.index!-1].works.listWork.length ; work ++)
               WorkForm(
                 userWork: usersWork[0],
                 index: work+1,
                 indexWorkPlace: widget.index,
                 onAddForm: (){
                   usersWork.add(UserWork(name: "name"));

                     HomeController.cvUser.workPlaces.listWorkPlace[widget.index!-1].works.listWork.add(Work.genCourse());
                   setState(() {

                   });
                 },
                 onDelete: (){
                  // usersWork.removeAt(work);
                   HomeController.cvUser.workPlaces.listWorkPlace[widget.index!-1].works.listWork.removeAt(work);
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
