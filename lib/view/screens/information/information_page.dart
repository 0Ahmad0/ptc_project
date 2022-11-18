import 'package:flutter/material.dart';
import 'package:ptc_project/view/resourse/values_manager.dart';

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
        backgroundColor: ColorManager.secondaryColor,
        actions: [
          IconButton(onPressed: (){
            setState(() {
              isEdit = false;
            });
          }, icon: Icon(Icons.edit)),
          IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
        ],
      ),
      body: IgnorePointer(
        ignoring: isEdit,
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ListView(
                padding: EdgeInsets.only(
                  bottom: AppPadding.p18
                ),
              ),
              ElevatedButton(onPressed: (){}, child: Text("Save"))
            ],
          ),
        ),
      ),
    );
  }
}
