import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ptc_project/view/resourse/style_manager.dart';
import 'package:ptc_project/view/resourse/values_manager.dart';
import 'package:ptc_project/view/screens/home/home_view.dart';
import 'package:ptc_project/view/widgets/custom_divider.dart';

import '../../resourse/color_manager.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  bool isEdit = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Information"),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              isEdit = false;
            });
          }, icon: Icon(Icons.edit)),
          IconButton(onPressed: (){
            setState(() {
              isEdit = true;
            });
          }, icon: Icon(Icons.restore)),
          IconButton(onPressed: (){
            Get.defaultDialog(
              radius: AppPadding.p4,
              title: "Are You Sure?",
              content: Text("Delete This CV 💔"),
              buttonColor: ColorManager.primaryColor,
             cancel: Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [

                 BuildButtonDialog(
                   onTap: ()=>Get.back(),
                   text: "No",
                   color: ColorManager.secondaryColor,
                 ),
                 const SizedBox(width: AppSize.s4,),
                 BuildButtonDialog(
                   onTap: ()=>Get.back(),
                   text: "Yes",
                   color: ColorManager.primaryColor,
                 ),

               ],
             )
            );
          }, icon: Icon(Icons.delete)),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView(
            children: [
              PTCDvider(
                  height: AppPadding.p40,
                text: "Personal Information",
                colors: [
                  ColorManager.primaryColor,
                  ColorManager.primaryColor,
                ]
              ),
              IgnorePointer(
                ignoring: isEdit,

                child: BuildFirstPage(
                    form: GlobalKey(),
                    controllerName: TextEditingController(text: "No"),
                    controllerAge: TextEditingController(text: "No"),
                    gender: "Male",
                    controllerAddress: TextEditingController(text: "No"),
                    controllerEmail: TextEditingController(text: "No"),
                    controllerPhone: TextEditingController(text: "No"),
                    controllerMilitary: TextEditingController(text: 'yes'),
                ),
              ),
              PTCDvider(
                height: AppPadding.p40,
                text: "Languages & Skills & Courses",
                colors: [
                  ColorManager.primaryColor,
                  ColorManager.primaryColor,
                ]
              ),
              IgnorePointer(
                ignoring: isEdit,
                child: BuildSecondPage(
                  form: GlobalKey(),
                ),
              ),
              PTCDvider(
                  height: AppPadding.p40,
                text: "Work Places",
                colors: [
                  ColorManager.primaryColor,
                  ColorManager.primaryColor,
                ]
              ),
              IgnorePointer(
                  ignoring: isEdit,
                  child: BuildThirdPage(formKey: GlobalKey())),
              PTCDvider(
                  height: AppPadding.p40,
                text: "Projects & Skills Technicals",
                colors: [
                  ColorManager.primaryColor,
                  ColorManager.primaryColor,
                ]
              ),
              IgnorePointer(
                  ignoring: isEdit,
                  child: BuildFourthPage(formKey: GlobalKey()))




            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p10),
            child: ElevatedButton(onPressed: isEdit?null:(){}, child: Text("Save")),
          ),
        ],
      ),
    );
  }
}

class BuildButtonDialog extends StatelessWidget {
  const BuildButtonDialog({
    Key? key, this.text, required this.color, required this.onTap,
  }) : super(key: key);
  final String? text;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20,
          vertical: AppPadding.p8
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppSize.s4)
        ),
        child: Text(text!,style: getRegularStyle(color: ColorManager.white),),
      ),
    );
  }
}
/*
IgnorePointer(
        ignoring: isEdit,
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: Column(
            children: [
              BuildSecondPage(form: GlobalKey()),
              ElevatedButton(onPressed: (){}, child: Text("Save"))

            ],
          ),

        ),
      )
 */