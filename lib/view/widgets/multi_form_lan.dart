import 'package:flutter/material.dart';
import 'package:ptc_project/view/widgets/language_form.dart';

import '../../model/models.dart';

class MultiFormLan extends StatefulWidget {
  const MultiFormLan({Key? key}) : super(key: key);

  @override
  State<MultiFormLan> createState() => _MultiFormLanState();
}

class _MultiFormLanState extends State<MultiFormLan> {
  List<UserLanguage> userLanguage = [
    UserLanguage()
  ];
  @override
  Widget build(BuildContext context) {
    return userLanguage.isEmpty?Center(child: Text("No Data Found"),)
    :ListView.builder(
      itemCount: userLanguage.length,
      itemBuilder: (_,index){
        return LanguageForm(
          index: index +1,
          userLanguage: userLanguage[index],
          onDelete: ()=> index==0?null:onDelete(index),
          onAddForm: () {
            setState(() {
              userLanguage.add(UserLanguage());
            });
          },

        );
      },
    );
  }
  void onAddForm(){
    setState(() {
      userLanguage.add(UserLanguage());
    });
  }
  void onDelete(int index){
    setState(() {
      userLanguage.removeAt(index);
    });
  }
}
