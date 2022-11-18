import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_search/multi_select_search.dart';

import '../../../model/utils/sizer.dart';
import '../../resourse/color_manager.dart';
import '../../resourse/style_manager.dart';
import '../../resourse/values_manager.dart';
import '../information/information_page.dart';


class SearchBody extends StatelessWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (_,index)=>BuildCVItem(),
    );
  }
}

class BuildCVItem extends StatelessWidget {
  const BuildCVItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Get.to(()=>InformationPage()),
      child: Container(
        margin: const EdgeInsets.all(AppMargin.m10),
        padding: const EdgeInsets.all(AppPadding.p12),
        height: Sizer.getH(context) / 6,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppSize.s4),
          boxShadow: [
            BoxShadow(
              color: ColorManager.lightGray.withOpacity(.2),
              blurRadius: AppSize.s8,
              offset: Offset(
                0 , AppSize.s4
              )
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.file_present_sharp),
            const SizedBox(height: AppSize.s10,),
            Row(
              children: [
                Text("Name : "),
                Text("Hiba Hashem ❤️",style: getBoldStyle(
                    fontSize: Sizer.getH(context) / 38,
                    color: ColorManager.primaryColor),),
              ],
            ),
            const SizedBox(height: AppSize.s10,),
            Text("Hiba Hashem ❤️"),

          ],
        ),
      ),
    );
  }
}

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<Contact> selectedItems = [];
  @override
  Widget build(BuildContext context) {
    var list = [
      Contact(1, "Joel McHale"),
      Contact(2, "Danny Pudi"),
      Contact(3, "Donald Glover"),
      Contact(4, "Gillian Jacobs"),
      Contact(5, "Alison Brie"),
      Contact(6, "Chevy Chase"),
      Contact(7, "Jim Rush"),
      Contact(8, "Yvette Nicole Brown"),
      Contact(9, "Jeff Winger"),
      Contact(10, "Abed Nadir"),
      Contact(11, "Troy Barnes"),
      Contact(12, "Britta Perry"),
      Contact(13, "Annie Edison"),
    ];

    List<Contact> initial = [
      list.first,
      list[1],
      list.last,
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: Column(
        children: [
          Expanded(
            child: MultiSelectSearch<Contact>(
              emptyListIndicator: Center(
                child: Text("Empty Data"),
              ),
              itemBuilder: (Contact item) => ListTile(
                key: ObjectKey(item),
                leading: const Icon(Icons.person),
                title: Text(item.name),
              ),
              chipLabelKey: 'name',
              items: list,
              initialValue: initial,
              onChanged: (List<Contact> items) =>
                  setState(() => selectedItems = items),
              decoration: BoxDecoration(
                border: const Border(
                  bottom: BorderSide(color: Colors.grey),
                ),
              ),
              clearAll: const Padding(
                padding: EdgeInsets.only(top: 10.0, right: 6.0),
                child: Icon(Icons.clear),
              ),
            ),
          ),
          Wrap(
            children: [
              for (var i = 0; i < selectedItems.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(selectedItems[i].name),
                )
            ],
          )
        ],
      ),
    );
  }
}

class Contact {
  final int id;
  final String name;

  Contact(
      this.id,
      this.name,
      );

  Contact.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}