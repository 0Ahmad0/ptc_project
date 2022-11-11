import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ptc_project/model/models.dart';
import 'package:ptc_project/view/resourse/color_manager.dart';
import 'package:ptc_project/view/resourse/values_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

typedef OnDelete();
typedef OnAddForm();

class CoursesForm extends StatefulWidget {
  final UserCourses? userCourses;
  final state = _CoursesFormState();
  final OnDelete? onDelete;
  final OnAddForm? onAddForm;
  final int? index;

  CoursesForm(
      {super.key,
      this.userCourses,
      this.onDelete,
      this.onAddForm,
      this.index = 1});

  @override
  _CoursesFormState createState() => state;

  bool isValid() => state.validate();
}

class _CoursesFormState extends State<CoursesForm> {
  final form = GlobalKey<FormState>();
  final dateController = TextEditingController(text: "Date");

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
                  Flexible(child: Text("Course${widget.index}")),
                  Row(
                    children: [
                      IconButton(
                          onPressed: widget.onDelete, icon: Icon(Icons.delete)),
                      IconButton(
                          onPressed: widget.onAddForm, icon: Icon(Icons.add)),
                    ],
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Course Name"),
              ),
              const SizedBox(
                height: AppSize.s10,
              ),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField(
                        decoration: InputDecoration(
                            hintText: "Course Level",
                            prefixIcon: Icon(FontAwesomeIcons.graduationCap)),
                        items: [1, 2, 3, 4, 5]
                            .map((e) => DropdownMenuItem(
                                  child: Text("$e"),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (val) {}),
                  ),
                  const SizedBox(
                    width: AppSize.s10,
                  ),
                  Expanded(
                      child: TextFormField(
                    controller: dateController,
                    readOnly: true,
                    onTap: () {
                      _selectDate(context);
                    },
                  )),
                ],
              ),
              const SizedBox(
                height: AppSize.s10,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Description"),
              ),
              const SizedBox(
                height: AppSize.s10,
              ),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Certificate Name",
                    ),
                  )),
                  const SizedBox(width: AppSize.s10,),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Certificate Type",
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSize.s10,),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Certificate Side",
                      ),
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

  bool validate() {
    var valid = form.currentState!.validate();
    if (valid) form.currentState!.save();
    return valid;
  }
}
