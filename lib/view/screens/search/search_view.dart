import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:multi_select_search/multi_select_search.dart';
import 'package:ptc_project/model/utils/const.dart';

import '../../../model/utils/sizer.dart';
import '../../resourse/color_manager.dart';
import '../../resourse/font_manager.dart';
import '../../resourse/style_manager.dart';
import '../../resourse/values_manager.dart';
import '../information/information_page.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (_, index) => BuildCVItem(),
    );
  }
}

class BuildCVItem extends StatelessWidget {
  final String? name;

  const BuildCVItem({super.key, this.name});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => InformationPage()),
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
                  offset: Offset(0, AppSize.s4))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.file_present_sharp),
            const SizedBox(
              height: AppSize.s10,
            ),
            Row(
              children: [
                Text("Name : "),
                Text(
                  name!,
                  style: getBoldStyle(
                      fontSize: Sizer.getH(context) / 38,
                      color: ColorManager.primaryColor),
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
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
  List<DataSearch> selectedItems = [DataSearch(1, "name")];
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: Column(
        children: [
          buildContainerSearch(context),
          Expanded(child: ListView.builder(
            itemCount: selectedItems.length,
            itemBuilder: (_,index)=>BuildCVItem(
              name: selectedItems[index].name,
            ),
          ))
        ],
      ),
    );
  }

  Container buildContainerSearch(BuildContext context) {
    return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorManager.primaryColor,
                width: .3
              )
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p4),
            child: Wrap(
              children: [
                for (var i = 0; i < selectedItems.length; i++)
                  Container(
                    margin: EdgeInsets.all(AppMargin.m8),
                    child: Chip(
                      label: Text(selectedItems[i].name),
                      onDeleted: () {
                        setState(() {
                          selectedItems.removeAt(i);
                        });
                      },
                      deleteIconColor: ColorManager.error,

                    ),
                  ),
                SizedBox(
                  width: Sizer.getH(context) / 3.5,
                  child: TextFormField(
                    onFieldSubmitted: (val){

                    },
                    controller: searchController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            if(searchController.text.trim().isNotEmpty){
                              selectedItems.add(
                                  DataSearch(0, searchController.text)
                              );
                              searchController.clear();
                            }
                          });
                        },
                        icon: Icon(Icons.search),
                      ),
                      hintText: "Search here",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSize.s8),
                          borderSide: BorderSide(
                              color: Colors.transparent
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSize.s8),
                          borderSide: BorderSide(
                              color: Colors.transparent
                          )
                      ),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSize.s8),
                          borderSide: BorderSide(
                              color: Colors.transparent
                          )),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSize.s8),
                          borderSide: BorderSide(
                              color: Colors.transparent
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
  }
}

class DataSearch {
  final int id;
  final String name;

  DataSearch(
    this.id,
    this.name,
  );

  DataSearch.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
